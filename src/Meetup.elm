module Meetup exposing (..)

import Json.Decode exposing (Decoder, decodeString, int, string)
import Json.Decode.Pipeline exposing (decode, required)


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
    }



{- type alias Meetup =
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
-}


meetupDecoder : Decoder Meetup
meetupDecoder =
    decode
        Meetup
        |> required "day" string
        |> required "description" string
        |> required "id" string
        |> required "location" string
        |> required "name" string
        |> required "time" string


meetup : String -> Result String Meetup
meetup jsonString =
    decodeString meetupDecoder jsonString
