module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, optional, required)
import Models exposing (Coordinates, Meetup, MeetupId)
import Msgs exposing (Msg)
import RemoteData


fetchMeetups : Cmd Msg
fetchMeetups =
    Http.get fetchMeetupsUrl meetupsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchMeetups


fetchMeetupsUrl : String
fetchMeetupsUrl =
    "http://localhost:4000/db"


meetupsDecoder : Decode.Decoder (List Meetup)
meetupsDecoder =
    Decode.at [ "data" ] (Decode.list meetupDecoder)



-- coordinatesDecoder : Decode.Decoder Coordinates
-- coordinatesDecoder =
--     decode Coordinates
--         |> required "latitude" Decode.string
--         |> required "longitude" Decode.string


meetupDecoder : Decode.Decoder Meetup
meetupDecoder =
    decode Meetup
        |> required "id" Decode.string
        |> required "day" Decode.string
        |> required "description" Decode.string
        |> required "location" Decode.string
        |> required "name" Decode.string
        |> required "time" Decode.string



-- |> optional "coordinates" coordinatesDecoder
-- |> optional "nextMeetup" Decode.string
-- |> optional "twitter" Decode.string
-- |> optional "url" Decode.string
