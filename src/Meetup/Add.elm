module Meetup.Add exposing (..)

import Html exposing (Html, button, div, form, input, label, span, text)
import Html.Attributes exposing (class, for, id, placeholder, type_, value)
import Html.Events exposing (onClick, onSubmit)
import Meetup exposing (Coordinates, Meetup, MeetupId)


type Msg
    = OnAddMeetup
    | Day String
    | Description String
    | Id String
    | Location String
    | Name String
    | Time String
    | Latitude String
    | Longitude String
    | NextMeetup String
    | Twitter String
    | Url String


meetupid : MeetupId
meetupid =
    ""


coords : Coordinates
coords =
    { latitude = ""
    , longitude = ""
    }


model : Meetup
model =
    { day = ""
    , description = ""
    , id = meetupid
    , location = ""
    , name = ""
    , time = ""
    , coordinates = Just coords
    , nextMeetup = Just ""
    , twitter = Just ""
    , url = Just ""
    }


update : Msg -> Meetup -> Meetup
update msg model =
    case msg of
        Day day ->
            { model | day = day }

        Description description ->
            { model | description = description }

        Id id ->
            { model | id = id }

        Location location ->
            { model | location = location }

        Name name ->
            { model | name = name }

        Time time ->
            { model | time = time }

        Latitude latitude ->
            -- { model | coordinates = Just { Just coords | latitude = latitude } }
            model

        Longitude longitude ->
            -- let
            --     coords =
            --         model.coordinates
            --     newCoords =
            --         { coords | longitude = longitude }
            -- in
            -- { model | coordinates = Just newCoords }
            model

        -- { model | coordinates = Just coords }
        NextMeetup nextMeetup ->
            { model | nextMeetup = Just nextMeetup }

        Twitter twitter ->
            { model | twitter = Just twitter }

        Url url ->
            { model | url = Just url }

        OnAddMeetup ->
            model


view : Meetup -> Html Msg
view model =
    form [ onSubmit OnAddMeetup ]
        [ input [ id "day", placeholder "day" ] []
        , input [ id "description", placeholder "description" ] []
        , input [ id "id", placeholder "id" ] []
        , input [ id "location", placeholder "location" ] []
        , input [ id "name", placeholder "name" ] []
        , input [ id "time", placeholder "time" ] []
        , span [] [ text "coordinates" ]
        , input [ id "latitude", placeholder "latitude" ] []
        , input [ id "longitude", placeholder "longitude" ] []
        , input [ id "nextMeetup", placeholder "nextMeetup" ] []
        , input [ id "twitter", placeholder "twitter " ] []
        , input [ id "url", placeholder "url" ] []
        , input [ type_ "submit", value "Submit" ] []
        ]
