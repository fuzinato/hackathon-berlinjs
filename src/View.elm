module View exposing (..)

import Helpers exposing (..)
import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Meetup.Single exposing (Coordinates, Meetup)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)


maybeList : WebData (List Meetup) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading"

        RemoteData.Success meetups ->
            listView meetups

        RemoteData.Failure error ->
            text (toString error)


listView : List Meetup -> Html Msg
listView meetups =
    div [ class "b-meetup-list" ]
        [ div [] (List.map meetupView meetups) ]


meetupView : Meetup -> Html Msg
meetupView meetup =
    let
        coords =
            getMaybeCoord meetup.coordinates
    in
    div [ class "b-meetup", onClick (Msgs.OnFetchMeetup meetup.id) ]
        [ div [] [ text meetup.name ]
        , div [] [ text meetup.location ]
        , div [] [ text coords.latitude ]
        , div [] [ text coords.longitude ]
        , div [] [ text meetup.description ]
        , div [] [ text meetup.time ]
        , div [] [ text (getMaybeStr meetup.twitter) ]
        ]
