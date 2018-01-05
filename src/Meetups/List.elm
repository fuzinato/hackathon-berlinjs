module Meetups.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (Coordinates, Meetup)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)


view : WebData (List Meetup) -> Html Msg
view meetups =
    div []
        [ nav
        , maybeList meetups
        ]


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Meetups" ] ]


maybeList : WebData (List Meetup) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading"

        RemoteData.Success meetups ->
            list meetups

        RemoteData.Failure error ->
            text (toString error)


list : List Meetup -> Html Msg
list meetups =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Description" ]
                    , th [] [ text "Coordinates" ]
                    , th [] [ text "Location" ]
                    , th [] [ text "Time" ]
                    , th [] [ text "URL" ]
                    , th [] [ text "Twitter" ]
                    , th [] [ text "Action" ]
                    ]
                ]
            , tbody [] (List.map meetupRow meetups)
            ]
        ]


getMaybeStr : Maybe String -> String
getMaybeStr ma =
    case ma of
        Just a ->
            a

        Nothing ->
            ""


getMaybeCoord : Maybe Coordinates -> Coordinates
getMaybeCoord ma =
    case ma of
        Just a ->
            a

        Nothing ->
            Coordinates "" ""


meetupRow : Meetup -> Html Msg
meetupRow meetup =
    let
        coords =
            getMaybeCoord meetup.coordinates
    in
    tr []
        [ td [] [ text meetup.id ]
        , td [] [ text meetup.name ]
        , td [] [ text meetup.description ]
        , td [] [ text (coords.latitude ++ " " ++ coords.latitude) ]
        , td [] [ text meetup.location ]
        , td [] [ text meetup.time ]
        , td [] [ text (getMaybeStr meetup.url) ]
        , td [] [ text (getMaybeStr meetup.twitter) ]
        , td []
            []
        ]
