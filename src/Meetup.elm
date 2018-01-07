module Meetup exposing (..)

import Json.Decode as Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, optional, optionalAt, required)


-- MODELS


type alias MeetupId =
    String


type alias Coordinates =
    { latitude : String
    , longitude : String
    }


type alias Meetup =
    { day : String
    , description : String
    , id : MeetupId
    , location : String
    , name : String
    , time : String
    , coordinates : Maybe Coordinates
    , nextMeetup : Maybe String
    , twitter : Maybe String
    , url : Maybe String
    }


type alias Meetups =
    { meetups : List Meetup
    }



-- DECODERS


coordinatesDecoder : Decode.Decoder Coordinates
coordinatesDecoder =
    decode Coordinates
        |> required "latitude" Decode.string
        |> required "longitude" Decode.string


meetupDecoder : Decode.Decoder Meetup
meetupDecoder =
    decode Meetup
        |> required "day" Decode.string
        |> required "description" Decode.string
        |> required "id" Decode.string
        |> required "location" Decode.string
        |> required "name" Decode.string
        |> required "time" Decode.string
        |> optional "coordinates" (Decode.map Just coordinatesDecoder) Nothing
        |> optional "nextMeetup" (Decode.map Just Decode.string) Nothing
        |> optional "twitter" (Decode.map Just Decode.string) Nothing
        |> optional "url" (Decode.map Just Decode.string) Nothing


meetupListDecoder : Decode.Decoder (List Meetup)
meetupListDecoder =
    Decode.at [ "data" ] (Decode.list meetupDecoder)


meetupSingleDecoder : Decode.Decoder Meetup
meetupSingleDecoder =
    Decode.at [ "data" ] meetupDecoder
