module Models exposing (..)

import Meetup exposing (Coordinates, Meetup, MeetupId)
import RemoteData exposing (WebData)


type alias Model =
    { meetups : WebData (List Meetup)
    , single : WebData Meetup
    , addMeetup : Meetup
    , route : Route
    }


dummyCoords : Coordinates
dummyCoords =
    Coordinates "" ""


dummyMeetup : Meetup
dummyMeetup =
    Meetup "" "" "" "" "" "" (Just dummyCoords) Maybe.Nothing Maybe.Nothing Maybe.Nothing



{- { day = ""
   , description = ""
   , id = ""
   , location = ""
   , name = ""
   , time = ""
   , coordinates = Just dummyCoords
   , nextMeetup = Just ""
   , twitter = Just ""
   , url = Just ""
   }
-}


initialModel : Model
initialModel =
    Model RemoteData.Loading RemoteData.Loading dummyMeetup NotFoundRoute


type Route
    = MeetupsRoute
    | MeetupRoute MeetupId
    | NotFoundRoute
    | AddMeetupRoute
