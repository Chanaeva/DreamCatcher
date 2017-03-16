port module Speak exposing (..)

-- port for sending strings out to JavaScript


port speak : String -> Cmd msg



-- port for listening for suggestions from JavaScript


port suggestions : (List String -> msg) -> Sub msg
