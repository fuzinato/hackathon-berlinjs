module Meetups.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, value)
import Meetups.List exposing (meetupRow)
import Models exposing (Coordinates, Meetup)
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


getMaybeCoord : Maybe Coordinates -> Coordinates
getMaybeCoord ma =
    case ma of
        Just a ->
            a

        Nothing ->
            Coordinates "" ""


formLevel : Meetup -> Html Msg
formLevel meetup =
    div []
        [ meetupRow meetup
        ]


listBtn : Html Msg
listBtn =
    a
        [ class "btn regular"
        , href meetupsPath
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]
