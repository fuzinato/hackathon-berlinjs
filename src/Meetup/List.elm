module Meetup.List exposing (..)

import API
import Http
import Json.Decode as Decode exposing (..)
import Meetup.Single exposing (Meetup, meetupDecoder)
import Msgs exposing (Msg)
import RemoteData


type alias Model =
    { meetups : List Meetup
    }


meetupsDecoder : Decode.Decoder (List Meetup)
meetupsDecoder =
    Decode.at [ "data" ] (Decode.list meetupDecoder)


fetchMeetups : Cmd Msg
fetchMeetups =
    Http.get API.meetupsUrl meetupsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchMeetups
