module Main exposing (init, subscriptions)

import Models exposing (Model, Route)
import Msgs exposing (Msg)
import Navigation exposing (Location)
import Update exposing (..)
import View exposing (maybeList, maybeSingle, view)


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



--Model


init : Location -> ( Model, Cmd Msg )
init location =
    let
        _ =
            Debug.log "i" location
    in
    navigateToLocation location Models.initialModel
