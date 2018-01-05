module Helpers exposing (..)

import Meetup.Single exposing (Coordinates)


getMaybeStr : Maybe String -> String
getMaybeStr ma =
    case ma of
        Just a ->
            a

        Nothing ->
            ""


getMaybeCoord : Maybe Coordinates -> Coordinates
getMaybeCoord ma =
    case ma of
        Just a ->
            a

        Nothing ->
            Coordinates "" ""
