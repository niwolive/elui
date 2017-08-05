module Main exposing (..)

import Html exposing (Html)
import Model exposing (Model, Msg)
import Update exposing (init, update)
import View exposing (view)
import Window


-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Window.resizes Model.Resize
