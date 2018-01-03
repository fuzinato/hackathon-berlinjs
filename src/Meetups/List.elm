module Meetups.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (Meetup)
import Msgs exposing (Msg)


view : List Meetup -> Html Msg
view meetups =
    div []
        [ nav
        , list meetups
        ]


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Meetups" ] ]


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
                    , th [] [ text "Twitter" ]
                    , th [] [ text "Action" ]
                    ]
                ]
            , tbody [] (List.map meetupRow meetups)
            ]
        ]


meetupRow : Meetup -> Html Msg
meetupRow meetup =
    tr []
        [ td [] [ text meetup.id ]
        , td [] [ text meetup.name ]
        , td [] [ text (toString meetup.description) ]
        , td [] [ text (toString meetup.coordinates) ]
        , td [] [ text (toString meetup.location) ]
        , td [] [ text (toString meetup.time) ]
        , td [] [ text (toString meetup.twitter) ]
        , td []
            []
        ]