module Msgs exposing (..)

import Meetup.Single exposing (Meetup)
import RemoteData exposing (WebData)


type Msg
    = OnFetchMeetups (WebData (List Meetup))
    | OnFetchMeetup String
