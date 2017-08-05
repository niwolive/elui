module Model exposing (..)

import Element exposing (Device, classifyDevice)
import Window


type alias Model =
    { device : Device
    , showMenu : Bool
    }


type Msg
    = Resize Window.Size
    | ToggleMenu
