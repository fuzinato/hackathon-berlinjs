module Meetups exposing (..)

import Json.Decode exposing (Decoder, decodeString, int, list, string)
import Json.Decode.Pipeline exposing (decode, required)
import Meetup exposing (Meetup, meetupDecoder)


-- type alias Meetups =
--     { meetups : List Meetup }
-- meetupsDecoder : Decoder Meetups
-- meetupsDecoder =
--     decode
--         Meetups
--         |> required "meetups" (list meetupDecoder)
-- meetups : String -> Result String Meetups
-- meetups jsonString =
--     decodeString meetupsDecoder jsonString
-- MODEL


type alias Coordinates =
    { latitude : String
    , longitude : String
    }


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
