module Meetup exposing (Meetup, meetupDecoder, renderMeetup)

import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class)
import Json.Decode as Json exposing (..)
import Json.Decode.Extra as Extra exposing ((|:), optionalField)


-- MODEL


type alias Coordinates =
    { latitude : String, longitude : String }


type alias Meetup =
    { day : String
    , description : String
    , id : String
    , location : String
    , name : String
    , time : String
    , coordinates : Maybe Coordinates
    , nextMeetup : Maybe String
    , twitter : Maybe String
    , url : Maybe String
    }



-- DECODERS


coordinatesDecoder : Decoder Coordinates
coordinatesDecoder =
    succeed Coordinates
        |: field "latitude" string
        |: field "longitude" string


meetupDecoder : Decoder Meetup
meetupDecoder =
    succeed Meetup
        |: field "day" string
        |: field "description" string
        |: field "id" string
        |: field "location" string
        |: field "name" string
        |: field "time" string
        |: optionalField "coordinates" coordinatesDecoder
        |: optionalField "nextMeetup" string
        |: optionalField "twitter" string
        |: optionalField "url" string


toStr : a -> String
toStr v =
    let
        str =
            toString v
    in
    if String.left 1 str == "\"" then
        String.dropRight 1 (String.dropLeft 1 str)
    else
        str


getMaybe : Maybe a -> String
getMaybe ma =
    case ma of
        Just a ->
            toStr a

        Nothing ->
            ""


parseCoords : Maybe { c | latitude : a, longitude : b } -> Coordinates
parseCoords ma =
    case ma of
        Just a ->
            Coordinates (toStr a.latitude) (toStr a.longitude)

        Nothing ->
            Coordinates "" ""


renderMeetup : Meetup -> Html msg
renderMeetup model =
    div [ class "meetup" ]
        [ div [] [ text model.name ]
        , div [] [ text (getMaybe model.twitter) ]
        , div [] [ text (parseCoords model.coordinates).latitude ]
        ]
