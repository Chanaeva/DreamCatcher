module Main exposing (..)

import Html exposing (program)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


--MODEL


type alias Model =
    { dream : String
    , dreamInput : String
    }


init : Model
init =
    { dream = ""
    , dreamInput = ""
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



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
    = SetDreamInput String
    | SaveDream
    | CancelDream


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetDreamInput value ->
            ( { model | dreamInput = value }, Cmd.none )

        SaveDream ->
            if String.isEmpty model.dreamInput then
                ( model, Cmd.none )
            else
                ( { model | dreamInput = model.dreamInput, dreamInput = "" }, Cmd.none )

        CancelDream ->
            ( { model | dreamInput = "" }, Cmd.none )


viewDreamInput : Model -> Html Msg
viewDreamInput model =
    div []
        [ input
            [ type_ "text"
            , placeholder "Dream"
            , value model.dreamInput
            , autofocus True
            , onInput SetDreamInput
            ]
            []
        , primaryButton SaveDream "Save"
        , primaryButton CancelDream "Cancel"
        ]


primaryButton : Msg -> String -> Html Msg
primaryButton msg name =
    button [ onClick msg ] [ text name ]


viewNav : String -> Html Msg
viewNav title =
    header []
        [ h1 [ class "text-center" ] [ text title ]
        , ul []
            [ ul [ attribute "role" "presentation" ]
                [ a [ href "#" ]
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
    footer [ class "text-center" ]
        [ a [ href "https://github.com/Chanaeva" ]
            [ text "Created By Chana Reynolds" ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ viewNav "DreamCatcher"
        , viewDreamInput model
        , div [ class "button-group" ]
            []
        , viewFooter
        , div [ class "debug" ] [ text (toString model) ]
        ]
