port module Ports exposing (..)


type alias Dream =
    { dream : String
    }



--outgoing


port toggleStartStop : String -> Cmd msg



--incoming


port listening : (String -> msg) -> Sub msg
