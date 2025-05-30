{-# LANGUAGE OverloadedStrings #-}

import Graphics.Rendering.Chart.Easy
    ( line, layout_title, plot, (.=), Default(def) )
import Graphics.Rendering.Chart.Backend.Diagrams ( toFile )

main :: IO ()
main = toFile def "grafico.png" $ do
    layout_title .= "Gráfico de y = sinx"
    plot (line "sinx" [ [(x, cos (log (x)) -x/2 ) | x <- [0.1,0.5..100] :: [Double]] ])
