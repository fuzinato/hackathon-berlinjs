module Models exposing (..)


type alias Model =
    { meetups : List Meetup
    }


initialModel : Model
initialModel =
    { meetups = [ Meetup "day" "desc" "id" "location" "name" "time" Nothing Nothing Nothing Nothing ]
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
