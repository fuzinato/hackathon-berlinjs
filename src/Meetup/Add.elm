module Meetup.Add exposing (..)

import Html exposing (Html, button, div, form, input, label, span, text)
import Html.Attributes exposing (class, for, id, placeholder, type_, value)
import Html.Events exposing (onClick, onSubmit)
import Meetup exposing (Coordinates, Meetup, MeetupId)
import Msgs exposing (Msg)


addMeetupForm : Html Msg
addMeetupForm =
    form [ onSubmit Msgs.OnAddMeetup ]
        [ input
            [ id "day"
            , placeholder "day "
            ]
            []
        , input
            [ id "description"
            , placeholder "description "
            ]
            []
        , input
            [ id "id", placeholder "id" ]
            []
        , input
            [ id "location"
            , placeholder "location "
            ]
            []
        , input
            [ id "name"
            , placeholder "name "
            ]
            []
        , input
            [ id "time"
            , placeholder "time "
            ]
            []
        , span
            []
            [ text "coordinates" ]
        , input
            [ id "latitude", placeholder "latitude" ]
            []
        , input
            [ id "longitude", placeholder "longitude" ]
            []
        , input
            [ id "nextMeetup"
            , placeholder "nextMeetup "
            ]
            []
        , input
            [ id "twitter"
            , placeholder "twitter "
            ]
            []
        , input
            [ id "url"
            , placeholder "url "
            ]
            []
        , input [ type_ "submit", value "Submit" ] []
        ]
