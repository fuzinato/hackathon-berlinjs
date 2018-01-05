module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { meetups : WebData (List Meetup)
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { meetups = RemoteData.Loading
    , route = route
    }


type alias MeetupId =
    String


type alias Coordinates =
    { latitude : String, longitude : String }


type alias Meetup =
    { day : String
    , description : String
    , id : MeetupId
    , location : String
    , name : String
    , time : String
    , coordinates : Maybe Coordinates
    , nextMeetup : Maybe String
    , twitter : Maybe String
    , url : Maybe String
    }


type Route
    = MeetupsRoute
    | MeetupRoute MeetupId
    | NotFoundRoute
