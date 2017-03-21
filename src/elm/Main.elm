module Main exposing (..)

import Html exposing (program)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Ports exposing (listening, toggleStartStop)


--MODEL


type alias Model =
    { dream : String
    }


init : Model
init =
    { dream = ""
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Ports.listening RecordDream



--MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = ( init, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



--UPDATE


type Msg
    = RecordDream String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RecordDream text ->
            ( { model | dream = text }, Cmd.none )


viewTextInput : String -> Html Msg
viewTextInput text =
    div [ class "text-center" ]
        [ input
            [ type_ "textarea"
            , value text
            , autofocus True
            ]
            []
        ]


viewNav : String -> Html Msg
viewNav title =
    header []
        [ h1 [ class "text-center" ] [ text title ]
        , ul []
            [ ul [ attribute "role" "presentation" ]
                [ a [ href "./static/signup.html" ]
                    [ text "Profile" ]
                ]
            , ul [ attribute "role" "presentation" ]
                [ a [ href "./static/d3.html" ]
                    [ text "WordCloud" ]
                ]
            ]
        ]


viewFooter : Html Msg
viewFooter =
    footer [ class "footer text-center" ]
        [ a [ href "https://github.com/Chanaeva" ]
            [ text "Created By Chana Reynolds" ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ viewNav "DreamCatcher"
        , viewTextInput model.dream
        , viewFooter
          -- , div [ class "debug" ] [ text (toString model) ]
        ]
