module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { meetups : WebData (List Meetup)
    }


initialModel : Model
initialModel =
    { meetups = RemoteData.Loading
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
