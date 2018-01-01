module Main exposing (..)


type alias Coordinates =
    { latitude : String
    , longitude : String
    }


type alias Meetup =
    { day : String
    , description : String
    , id : String
    , location : String
    , name : String
    , time : String
    , coordinates : Maybe Coordinates
    , nextMeetup : Maybe String
    , twitter : Maybe String
    , url : Maybe String
    }
