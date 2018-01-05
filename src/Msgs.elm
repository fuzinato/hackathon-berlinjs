module Msgs exposing (..)

import Models exposing (Meetup)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchMeetups (WebData (List Meetup))
    | OnLocationChange Location
