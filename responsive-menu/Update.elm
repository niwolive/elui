module Update exposing (..)

import Element exposing (classifyDevice)
import Model exposing (Model, Msg)
import Task exposing (perform)
import Window


init : ( Model, Cmd Msg )
init =
    ( { device = Element.classifyDevice (Window.Size 0 0)
      , showMenu = False
      }
    , Task.perform Model.Resize Window.size
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ device, showMenu } as model) =
    case msg of
        Model.Resize newSize ->
            ( { model | device = Element.classifyDevice newSize }
            , Cmd.none
            )

        Model.ToggleMenu ->
            ( { model | showMenu = not showMenu }
            , Cmd.none
            )
