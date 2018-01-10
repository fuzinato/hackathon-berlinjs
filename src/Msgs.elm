module Msgs exposing (..)

import Meetup exposing (Meetup)
import Meetup.Add
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchMeetups (WebData (List Meetup))
    | OnFetchMeetup (WebData Meetup)
    | OnRequestMeetup String
    | OnLocationChange Location
    | OnAddMeetup
    | ShowAddMeetupView
    | OnUpdateAddForm Meetup.Add.Msg
