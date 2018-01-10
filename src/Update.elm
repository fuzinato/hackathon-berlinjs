module Update exposing (..)

import Commands exposing (fetchMeetup, fetchMeetups)
import Meetup.Add
import Models exposing (Model, Route)
import Msgs exposing (..)
import Navigation exposing (Location)
import Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnFetchMeetups meetups ->
            ( { model | meetups = meetups }, Cmd.none )

        OnRequestMeetup id ->
            ( model, Navigation.newUrl ("meetup/" ++ id) )

        OnFetchMeetup meetup ->
            ( { model | single = meetup }, Cmd.none )

        OnLocationChange location ->
            navigateToLocation location model

        ShowAddMeetupView ->
            ( model, Navigation.newUrl "add" )

        OnUpdateAddForm childMsg ->
            ( { model | addMeetup = Meetup.Add.update childMsg model.addMeetup }, Cmd.none )

        --  { model | firstParser = ParserComponent.update m model.firstParser}
        OnAddMeetup ->
            ( model, Cmd.none )


navigateToLocation : Location -> Model -> ( Model, Cmd Msg )
navigateToLocation location model =
    let
        route =
            Routing.parseLocation location
    in
    case route of
        Models.MeetupsRoute ->
            ( { model | route = route }, fetchMeetups )

        Models.MeetupRoute id ->
            ( { model | route = route }, fetchMeetup id )

        Models.NotFoundRoute ->
            ( { model | route = route }, Cmd.none )

        Models.AddMeetupRoute ->
            ( { model | route = route }, Cmd.none )
