module View exposing (..)

import Debug exposing (log)
import Html exposing (Html, div, text)
import Meetups.Edit
import Meetups.List
import Models exposing (MeetupId, Model)
import Msgs exposing (Msg)
import RemoteData


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.MeetupsRoute ->
            Meetups.List.view model.meetups

        Models.MeetupRoute id ->
            meetupEditPage model id

        Models.NotFoundRoute ->
            notFoundView


meetupEditPage : Model -> MeetupId -> Html Msg
meetupEditPage model meetupId =
    case model.meetups of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success meetups ->
            let
                maybeMeetup =
                    meetups
                        |> List.filter (\meetup -> meetup.id == meetupId)
                        |> List.head
            in
            case maybeMeetup of
                Just meetup ->
                    Meetups.Edit.view meetup

                Nothing ->
                    notFoundView

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
