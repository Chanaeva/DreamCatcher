module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Models exposing (Model)


viewNav : String -> Html Msg
viewNav nav =
    header []
        [ ul [ class "nav nav-tabs" ]
            [ li [ class "active", attribute "role" "presentation" ]
                [ a [ href "#" ]
                    [ text "Home" ]
                ]
            , li [ attribute "role" "presentation" ]
                [ a [ href "#" ]
                    [ text "Profile" ]
                ]
            , li [ attribute "role" "presentation" ]
                [ a [ href "#" ]
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
        , viewFooter
        ]
