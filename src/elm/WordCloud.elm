module WordCloud exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import List
import Debug exposing (log)
import String
import Random
import Array


type alias Model =
    List Word


type alias Word =
    { freq : Int
    , value : String
    }


type Msg
    = NoOp


main : Program Never Model Msg
main =
    Html.program
        { init = ( init, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Model
init =
    [ { freq = 10, value = "apple" }
    , { freq = 30, value = "friends" }
    ]


subscriptions : Model -> Sub Msg
subscriptions model =



viewWord : Word -> Html Msg
viewWord word =
    div [ class "wordWrapper" ]
        [ span [] [ text word.value ]
        ]


view : Model -> Model -> Html Msg
view model =
    div [ class "cloudContainer" ]
        [ div [ style [ ( "width", "300px" ) ] ]
            (List.map viewWord model.words)
        ]


update : Model -> Model -> Model
update message model =
    model
