module Main exposing (Model, init, subscriptions, update, view)

import Html exposing (..)
import Meetup.List exposing (fetchMeetups)
import Meetup.Single exposing (Meetup)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import View exposing (maybeList)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { meetups : WebData (List Meetup)
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchMeetups meetups ->
            ( { model | meetups = meetups }, Cmd.none )

        Msgs.OnFetchMeetup id ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ maybeList model.meetups
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- INIT


init : ( Model, Cmd Msg )
init =
    ( Model RemoteData.Loading, fetchMeetups )
