module Main exposing (Msg(..), main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Form =
    { name : String

    --    , age : Int
    --    , password : String
    }


type alias Model =
    { isModalOpen : Bool
    , formData : Form
    }


init : Model
init =
    Model False { name = "" }



-- UPDATE


type Msg
    = Open
    | Close


update : Msg -> Model -> Model
update msg model =
    case msg of
        Open ->
            { model | isModalOpen = True }

        Close ->
            { model | isModalOpen = False }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Open ] [ text "Open" ]
        , viewModal model Close
        ]


getDisplayValue : Bool -> String
getDisplayValue isVisible =
    if isVisible == True then
        "block"

    else
        "none"


viewModal : Model -> msg -> Html msg
viewModal model toMsg =
    let
        prop =
            getDisplayValue model.isModalOpen
    in
    div [ style "display" prop, class "modal" ]
        [ div [ class "modal-content" ]
            [ span [ class "close", onClick toMsg ] [ text "&times;" ]
            , p [] [ text "Some text in the Modal" ]
            ]
        ]
