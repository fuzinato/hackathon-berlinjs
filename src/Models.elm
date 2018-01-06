module Models exposing (..)

import Meetup.Single exposing (Meetup, MeetupId)
import RemoteData exposing (WebData)


type alias Model =
    { meetups : WebData (List Meetup)
    , single : WebData Meetup
    , route : Route
    }


type Route
    = MeetupsRoute
    | MeetupRoute MeetupId
    | NotFoundRoute
