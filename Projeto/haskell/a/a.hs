
{-# LANGUAGE OverloadedStrings #-}

import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Diagrams

main :: IO ()
main = toFile def "seno.png" $ do
    layout_title .= "Gráfico do seno"
    plot (line "sinx" [ [(x, cos (log (x)) -x/2 ) | x <- [0.1,0.101..5] :: [Double]] ])
