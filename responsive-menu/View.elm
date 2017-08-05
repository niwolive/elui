module View exposing (view)

import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)
import Html exposing (Html)
import Model exposing (Model, Msg)
import Styles exposing (..)


view : Model -> Html Msg
view model =
    Element.layout stylesheet <|
        column None
            []
            [ responsiveMenu model ]


responsiveMenu : Model -> Element Styles variation Msg
responsiveMenu model =
    let
        links =
            List.map
                (\link -> el None [] (text link))
                [ "Lorem", "Ipsum", "Dolor", "Sit", "Amet" ]

        foldingMenu =
            [ row None
                [ height (percent 99)
                , verticalCenter
                , center
                , onClick Model.ToggleMenu
                ]
                [ text "=" ]
                |> below
                    (if model.showMenu then
                        [ column Fold
                            [ height (px <| toFloat model.device.height - 60), padding 10 ]
                            links
                        ]
                     else
                        [ empty ]
                    )
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
        (if model.device.phone || model.device.tablet then
            foldingMenu
         else
            spreadMenu
        )
