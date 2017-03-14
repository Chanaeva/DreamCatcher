module View exposing (..)

import Html exposing (Html, Attribute, div, input, text, button, h1)
import Msgs exposing (Msg)
import Models exposing (Model)



view : Model -> Html Msg
view model =
    div []
        [ h1 [] [  text "DreamCatcher" ]
        -- , input [] []
        -- , button [] [ text "Record Dream" ]
        ]



    -- ul []
    --      [ class "nav nav-tabs" ]
    --      [ li [ class "active", attribute "role" "presentation" ]
    --      [ a [ href "#" ]
    --         [ text "Home" ]
    --      ]
    --      , li [ attribute "role" "presentation" ]
    --      [ a [ href "#" ]
    --         [ text "Profile" ]
    --      ]
    --      , li [ attribute "role" "presentation" ]
    --      [ a [ href "#" ]
    --         [ text "Messages" ]
    --     ]
    --  ]
