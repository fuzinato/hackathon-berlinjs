module Main exposing (init, subscriptions, update)

import API
import Commands exposing (fetchMeetup, fetchMeetups)
import Models exposing (Model, Route)
import Msgs exposing (Msg)
import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Routing exposing (parseLocation)
import View exposing (maybeList, view)


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchMeetups meetups ->
            ( { model | meetups = meetups }, Cmd.none )

        Msgs.OnRequestMeetup id ->
            ( model, fetchMeetup id )

        Msgs.OnFetchMeetup meetup ->
            ( { model | single = meetup }, Navigation.newUrl "#meetup/7f7bedb5-f994-4a3a-935d-1e62d5007669" )

        Msgs.OnLocationChange location ->
            let
                route =
                    Routing.parseLocation location
            in
            ( { model | route = route }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
    ( Model RemoteData.Loading RemoteData.Loading currentRoute, fetchMeetups )
