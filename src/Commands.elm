module Commands exposing (..)

import API
import Http
import Meetup exposing (meetupListDecoder, meetupSingleDecoder)
import Msgs exposing (Msg)
import RemoteData


fetchMeetups : Cmd Msg
fetchMeetups =
    Http.get API.meetupsUrl meetupListDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchMeetups


fetchMeetup : String -> Cmd Msg
fetchMeetup id =
    Http.get (API.meetupUrl id) meetupSingleDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchMeetup
