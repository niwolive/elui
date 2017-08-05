module Styles exposing (..)

import Color
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font


type Styles
    = None
    | NavBar
    | Fold


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ style None []
        , style NavBar
            [ Color.background Color.lightGrey
            , Font.size 16
            ]
        , style Fold
            [ Color.background Color.charcoal
            ]
        ]
