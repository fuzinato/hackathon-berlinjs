module Msgs exposing (..)

import Meetup.Single exposing (Meetup)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchMeetups (WebData (List Meetup))
    | OnFetchMeetup (WebData Meetup)
    | OnRequestMeetup String
    | OnLocationChange Location
