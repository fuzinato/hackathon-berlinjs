module View exposing (..)

import Helpers exposing (..)
import Html exposing (Html, button, div, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick, onSubmit)
import Meetup.Add exposing (addMeetupForm)
import Meetup exposing (Coordinates, Meetup, MeetupId)
import Models exposing (Model, Route)
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


maybeSingle : WebData Meetup -> Html Msg
maybeSingle response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading"

        RemoteData.Success meetup ->
            singleView meetup

        RemoteData.Failure error ->
            text (toString error)


listView : List Meetup -> Html Msg
listView meetups =
    div [ class "b-meetup-list" ]
        [ div [] (List.map singleView meetups)
        , button [ onClick Msgs.ShowAddMeetupView ] [ text "Add Meetup" ]
        ]


meetupView : Meetup -> Html Msg
meetupView meetup =
    let
        coords =
            getMaybeCoord meetup.coordinates
    in
    div []
        [ div [] [ text meetup.name ]
        , div [] [ text meetup.location ]
        , div [] [ text coords.latitude ]
        , div [] [ text coords.longitude ]
        , div [] [ text meetup.description ]
        , div [] [ text meetup.time ]
        , div [] [ text (getMaybeStr meetup.twitter) ]
        ]


singleView : Meetup -> Html Msg
singleView meetup =
    div [ class "b-meetup m-single" ]
        [ meetupView meetup
        , button [ onClick (Msgs.OnRequestMeetup meetup.id) ]
            [ text "Edit"
            ]
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.MeetupsRoute ->
            maybeList model.meetups

        Models.MeetupRoute id ->
            maybeSingle model.single

        Models.AddMeetupRoute ->
            addMeetupForm

        Models.NotFoundRoute ->
            notFoundView
