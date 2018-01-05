module Meetups.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, value)
import Models exposing (Meetup)
import Msgs exposing (Msg)
import Routing exposing (meetupsPath)


view : Meetup -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Meetup -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listBtn ]


form : Meetup -> Html Msg
form meetup =
    div [ class "m3" ]
        [ h1 [] [ text meetup.name ]
        , formLevel meetup
        ]


formLevel : Meetup -> Html Msg
formLevel meetup =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Level" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString meetup.name) ]
            , btnLevelDecrease meetup
            , btnLevelIncrease meetup
            ]
        ]


btnLevelDecrease : Meetup -> Html Msg
btnLevelDecrease meetup =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-minus-circle" ] [] ]


btnLevelIncrease : Meetup -> Html Msg
btnLevelIncrease meetup =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-plus-circle" ] [] ]


listBtn : Html Msg
listBtn =
    a
        [ class "btn regular"
        , href meetupsPath
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]
