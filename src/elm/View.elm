module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Models exposing (Model)


textBox : Html Msg
textBox =
    textarea [ id "textarea" ]
        [ button [] []
        ]


viewNav : String -> Html Msg
viewNav nav =
    header []
        [ ul [ class "nav nav-tabs" ]
            [ li [ attribute "role" "presentation" ]
                [ a [ href "#" ]
                    [ text "Profile" ]
                ]
            , li [ attribute "role" "presentation" ]
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
        , textBox
        , viewFooter
        ]
