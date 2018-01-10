module Helpers exposing (..)

import Meetup exposing (Coordinates)


getMaybeStr : Maybe String -> String
getMaybeStr ma =
    case ma of
        Just a ->
            a

        Nothing ->
            ""



-- getMaybeStr x =
--     Maybe.withDefault "" x


getMaybeCoord : Maybe Coordinates -> Coordinates
getMaybeCoord ma =
    case ma of
        Just a ->
            a

        Nothing ->
            Coordinates "" ""
