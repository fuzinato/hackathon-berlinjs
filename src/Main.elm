module Main exposing (Model, Msg, init, subscriptions, update, view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Http exposing (..)
import Json.Decode as Json


-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Coordinates =
    { latitude : String
    , longitude : String
    }


type alias Meetup =
    { day : String
    , description : String
    , id : String
    , location : String
    , name : String
    , time : String
    , coordinates : Maybe Coordinates
    , nextMeetup : Maybe String
    , twitter : Maybe String
    , url : Maybe String
    }


type Meetups
    = List Meetup


type alias Model =
    { data : Meetups
    , url : String
    }



-- UPDATE


type Msg
    = Load
    | NewData (Result Http.Error Meetups)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Load ->
            ( model, loadMeetupData model.url )

        NewData (Ok newUrl) ->
            ( model, Cmd.none )

        NewData (Err _) ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Load ] [ text "Load" ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- INIT


initMeetups : Meetups
initMeetups =
    List ""


init : ( Model, Cmd Msg )
init =
    ( Model initMeetups "url", Cmd.none )



-- HTTP


getMetadata : Http.Request Meetups
getMetadata =
    Http.get "https://example.com/books/war-and-peace/metadata" decodeMetadata


decodeMetadata : Json.Decoder List Meetup
decodeMetadata =
    Json.at [ "data" ] Json.list


loadMeetupData : String -> Cmd Msg
loadMeetupData url =
    Http.send NewData getMetadata
