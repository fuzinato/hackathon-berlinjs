module Msgs exposing (..)

import Models exposing (Meetup)
import RemoteData exposing (WebData)


type Msg
    = OnFetchMeetups (WebData (List Meetup))
