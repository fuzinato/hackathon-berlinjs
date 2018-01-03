module View exposing (..)

import Html exposing (Html, div, text)
import Meetups.List
import Models exposing (Model)
import Msgs exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    Meetups.List.view model.meetups
