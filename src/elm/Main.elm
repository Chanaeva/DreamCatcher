module Main exposing (..)

import Html exposing (program)
import Msgs exposing (Msg)
import Models exposing (Model)
import Update exposing (update)
import View exposing (view)


-- import Speak exposing (..)


init : ( Model, Cmd Msg )
init =
    ( "Hello", Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
