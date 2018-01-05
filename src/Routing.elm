module Routing exposing (..)

import Models exposing (MeetupId, Route(..))
import Navigation exposing (Location)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map MeetupsRoute top
        , map MeetupRoute (s "meetups" </> string)
        , map MeetupsRoute (s "meetups")
        ]


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


meetupsPath : String
meetupsPath =
    "#meetups"


meetupPath : MeetupId -> String
meetupPath id =
    "#meetups/" ++ id
