module Meetups exposing (..)

import Json.Decode exposing (Decoder, decodeString, int, list, string)
import Json.Decode.Pipeline exposing (decode, required)
import Meetup exposing (Meetup, meetupDecoder)


type alias Meetups =
    { meetups : List Meetup }


meetupsDecoder : Decoder Meetups
meetupsDecoder =
    decode
        Meetups
        |> required "meetups" (list meetupDecoder)


meetups : String -> Result String Meetups
meetups jsonString =
    decodeString meetupsDecoder jsonString
