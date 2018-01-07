module User exposing (..)

import API
import Http
import Json.Decode as Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as Encode exposing (..)
import Msgs exposing (Msg)


type alias Access =
    { token : String
    }


tokenDecoder : Decode.Decoder -> Access
tokenDecoder =
    decode Access
        |> required "Token" Decode.string


jsonify : String -> Http.Body
jsonify str =
    Http.jsonBody <| Encode.object [ ( "sentiment", Encode.string str ) ]


decodeJson : Decode.Decoder String
decodeJson =
    Decode.map2 (\classification status -> classification)
        (Decode.field "classification" Decode.string)
        (Decode.field "status" Decode.int)


fetchSentiment : String -> Cmd Msg
fetchSentiment sentiment =
    Http.send Fetch (Http.post (jsonify sentiment) decodeJson)



{- fetchSentiment : String -> Cmd Msg
   fetchSentiment sentiment =
       Http.send Fetch (postSentiment sentiment decodeJson)

   postSentiment : String -> Decode.Decoder String -> Http.Request String
   postSentiment sentiment decoder =
       Http.request
           { method = "POST"
           , headers = [(Http.header "Content-Type" "application/json")]
           , url = API.userRegisterUrl
           , body = (jsonify sentiment)
           , expect = Http.expectJson decoder
           , timeout = Nothing
           , withCredentials = False
           }
-}
