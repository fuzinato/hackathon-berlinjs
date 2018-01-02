module Main exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Http exposing (..)
import Json.Decode as Json exposing (..)
import Meetup exposing (Meetup, meetupDecoder, renderMeetup)


-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( Model [] "http://localhost:8000/data.json", Cmd.none )



-- ( Model [] "http://berlin-meetup.glitch.me/meetup", Cmd.none )
-- MODEL


type alias Model =
    { meetups : List Meetup
    , url : String
    }



-- UPDATE


type Msg
    = Load
    | NewData (Result Http.Error (List Meetup))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Load ->
            ( model, loadMeetupData model.url )

        NewData (Ok newmeetups) ->
            ( Model newmeetups model.url, Cmd.none )

        NewData (Err _) ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Load ] [ text "Load" ]
        , div [] (List.map renderMeetup model.meetups)
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- HTTP


decodeMetadata : Json.Decoder (List Meetup)
decodeMetadata =
    Json.at [ "data" ] (Json.list meetupDecoder)


loadMeetupData : String -> Cmd Msg
loadMeetupData url =
    Http.send NewData (Http.get url decodeMetadata)
