module Routing exposing (..)

import Models exposing (..)
import Navigation exposing (Location)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map MeetupsRoute top
        , map MeetupRoute (s "meetup" </> string)
        , map MeetupsRoute (s "meetups")
        , map AddMeetupRoute (s "add")
        , map NotFoundRoute top
        ]


parseLocation : Location -> Route
parseLocation location =
    case parsePath matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
