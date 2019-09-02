module Ui.Scenes.FinishMenu.View exposing (view)

import Html
import Html.Attributes
import Html.Events
import List
import Types
import Ui.Scenes.FinishMenu.Update
import Ui.Scenes.Style


getDriveTimeSeconds : Int -> Int
getDriveTimeSeconds time =
    if time == 0 then
        0

    else
        time // 1000


getDriveTimeMilliSeconds : Int -> String
getDriveTimeMilliSeconds time =
    if time == 0 then
        "0"

    else
        let
            ms =
                String.fromInt
                    (round
                        (toFloat
                            (time
                                - (getDriveTimeSeconds time * 1000)
                            )
                            / 10
                        )
                    )
        in
        if String.length ms == 1 then
            "0" ++ ms

        else
            ms


view : Types.Model -> Html.Html Types.Msg
view model =
    Html.div
        (Ui.Scenes.Style.globalContainer ++ Ui.Scenes.Style.menuContainer)
        [ Html.img
            [ Html.Attributes.src "assets/logo.png"
            , Html.Attributes.style "width" "70vh"
            , Html.Attributes.style "height" "auto"
            ]
            []
        , Html.div
            [ Html.Attributes.style "display" "flex"
            , Html.Attributes.style "flex-direction" "row"
            , Html.Attributes.style "width" "100%"
            , Html.Attributes.style "justify-content" "center"
            ]
            [ Html.div
                (Ui.Scenes.Style.menuItemLeft
                    ++ Ui.Scenes.Style.menuItem
                    ++ Ui.Scenes.Style.centeredText
                )
                [ Html.text "YOUR TIME"
                , Html.div Ui.Scenes.Style.spaceTop
                    [ Html.text
                        (String.fromInt
                            (getDriveTimeSeconds model.myPlayer.time)
                        )
                    , Html.text ":"
                    , Html.text (getDriveTimeMilliSeconds model.myPlayer.time)
                    , Html.text " seconds"
                    ]
                ]
            , Html.div
                (Ui.Scenes.Style.menuItem
                    ++ Ui.Scenes.Style.centeredText
                    ++ Ui.Scenes.Style.menuItemRight
                )
                [ Html.text "COMPETITIVE POSITION"
                , Html.div Ui.Scenes.Style.spaceTop
                    [ highScoreList model ]
                ]
            ]
        , Html.button
            (Ui.Scenes.Style.button
                ++ [ Html.Events.onClick
                        (Types.SceneManager
                            (Types.ChangeTo
                                Ui.Scenes.FinishMenu.Update.restoreInitialModel
                                Types.Menu
                            )
                        )
                   ]
            )
            [ Html.text "Back to Menu" ]
        ]


highScoreList : Types.Model -> Html.Html Types.Msg
highScoreList model =
    let
        playerList =
            model.myPlayer :: model.onlinePlayers

        sortFunction a b =
            let
                aRoundStr =
                    String.fromInt a.currentLab

                bRoundStr =
                    String.fromInt b.currentLab

                aCheckpointsStr =
                    String.fromInt (List.length a.catchedCheckpoints)

                bCheckpointsStr =
                    String.fromInt (List.length b.catchedCheckpoints)

                aValue =
                    Debug.log "A " (aRoundStr ++ aCheckpointsStr)

                bValue =
                    Debug.log "B " (bRoundStr ++ bCheckpointsStr)
            in
            case compare aValue bValue of
                LT ->
                    GT

                EQ ->
                    EQ

                GT ->
                    LT

        sortedList =
            -- Sort by lab and checkpoint
            List.sortWith sortFunction
                -- Filter lobby associated players
                (List.filter
                    (\x ->
                        List.member x.identifier
                            (model.myPlayer.identifier
                                :: model.ownLobby.onlinePlayers
                            )
                    )
                    playerList
                )

        highScoreItem : Types.Player -> Html.Html Types.Msg
        highScoreItem p =
            Html.div
                (Ui.Scenes.Style.selectionContainer
                    ++ [ Html.Attributes.style "display" "flex"
                       , Html.Attributes.style "flex-direction" "row"
                       , Html.Attributes.style "cursor" "normal"
                       ]
                )
                -- Display player name
                [ Html.div [ Html.Attributes.style "flex" "1" ]
                    [ Html.text p.label.text ]

                -- Display racing time
                , Html.div [ Html.Attributes.style "flex" "1" ]
                    [ Html.text
                        (String.fromInt (getDriveTimeSeconds p.time)
                            ++ ":"
                            ++ getDriveTimeMilliSeconds p.time
                            ++ " s"
                        )
                    ]
                ]
    in
    Html.div [] (List.map highScoreItem sortedList)
