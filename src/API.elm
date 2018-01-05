module API exposing (..)


api : String
api =
    "http://berlin-meetup.glitch.me"


meetupsUrl : String
meetupsUrl =
    api ++ "/meetup"


meetupUrl : Int -> String
meetupUrl id =
    api ++ "/meetup/" ++ toString id


userRegisterUrl : String
userRegisterUrl =
    api ++ "/user/register"


userLoginUrl : String
userLoginUrl =
    api ++ "/user/login"
