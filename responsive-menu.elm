module Main exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html exposing (Html)
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font
import Task exposing (Task, perform)
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



-- MODEL


type alias Model =
    { device : Device }


init : ( Model, Cmd Msg )
init =
    ( Model (Element.classifyDevice (Window.Size 0 0))
    , Task.perform Resize Window.size
    )



-- UPDATE


type Msg
    = Resize Window.Size


update : Msg -> Model -> ( Model, Cmd msg )
update (Resize newSize) model =
    ( Model (Element.classifyDevice newSize)
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Window.resizes Resize



-- VIEW


view : Model -> Html Msg
view model =
    Element.layout stylesheet <|
        column None
            []
            [ responsiveMenu model.device ]


responsiveMenu : Device -> Element Styles variation msg
responsiveMenu device =
    let
        links =
            List.map
                (\link -> el None [] (text link))
                [ "Lorem", "Ipsum", "Dolor", "Sit", "Amet" ]

        foldingMenu =
            [ row None
                [ height (percent 99), verticalCenter, center ]
                [ text "=" ]
                |> below
                    [ column Fold
                        [ height (px <| toFloat device.height - 60), padding 10 ]
                        links
                    ]
            ]

        spreadMenu =
            [ el None [] (text "Logo")
            , row None
                [ spacing 20 ]
                links
            ]
    in
    row NavBar
        [ justify, height (px 60), verticalCenter ]
        (if device.phone || device.tablet then
            foldingMenu
         else
            spreadMenu
        )



-- STYLES


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
