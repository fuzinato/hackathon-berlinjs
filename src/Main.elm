module Main exposing (Model, Msg, init, subscriptions, update, view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Http exposing (..)
import Json.Decode as Json exposing (..)
import Json.Decode.Extra as Extra exposing ((|:), optionalField)


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


type alias Model =
    { meetups : List Meetup
    , url : String
    }



-- DECODERS


coordinatesDecoder : Decoder Coordinates
coordinatesDecoder =
    succeed Coordinates
        |: field "latitude" string
        |: field "longitude" string


meetupDecoder : Decoder Meetup
meetupDecoder =
    succeed Meetup
        |: field "day" string
        |: field "description" string
        |: field "id" string
        |: field "location" string
        |: field "name" string
        |: field "time" string
        |: optionalField "coordinates" coordinatesDecoder
        |: optionalField "nextMeetup" string
        |: optionalField "twitter" string
        |: optionalField "url" string



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
        [ button [ onClick Load ]
            [ text "Load" ]
        , text
            (toString model.meetups)
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
