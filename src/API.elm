module API exposing (..)


api : String
api =
    "http://localhost:8080"


meetupsUrl : String
meetupsUrl =
    api ++ "/meetup"


meetupUrl : String -> String
meetupUrl id =
    api ++ "/meetup/" ++ id


userRegisterUrl : String
userRegisterUrl =
    api ++ "/user/register"


userLoginUrl : String
userLoginUrl =
    api ++ "/user/login"
