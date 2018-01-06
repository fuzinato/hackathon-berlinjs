module Commands exposing (..)

import API
import Http
import Meetup.List exposing (meetupsDecoder)
import Meetup.Single exposing (meetupDecoder)
import Msgs exposing (Msg)
import RemoteData


fetchMeetups : Cmd Msg
fetchMeetups =
    Http.get API.meetupsUrl meetupsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchMeetups


fetchMeetup : String -> Cmd Msg
fetchMeetup id =
    Http.get (API.meetupUrl id) meetupDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchMeetup
