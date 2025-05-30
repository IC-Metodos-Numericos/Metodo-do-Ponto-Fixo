import Prelude
import Data.Maybe (fromMaybe)
import System.IO
import GHC.Float (double2Float)
import Prelude
import Text.Printf (printf)

-- Método de iteração de ponto fixo que retorna a lista de iterações e status de convergência
fixedPoint :: (Double -> Double) -> Double -> Double -> Int -> ([Double], Bool)
fixedPoint g x0 tol maxIter = (go x0 0, converged x0 0)
  where
    go x n
      | n >= maxIter         = [x]
      | abs (xNext - x) < tol = [x, xNext]
      | otherwise            = x : go xNext (n + 1)
      where
        xNext = g x

    converged x n
      | n >= maxIter          = False
      | abs (xNext - x) < tol = True
      | otherwise             = converged xNext (n + 1)
      where
        xNext = g x

-- Exemplo: resolver x = (x^3 + 3) / 9
main :: IO ()
main = do
    let g = \x -> (x ** 3 + 3) / 9
        x0 = 0.5
        tol = 1e-3
        maxIter = 100
        (iters, didConverge) = fixedPoint g x0 tol maxIter

    putStrLn "Iterations:"
    mapM_ (\(i, x) -> printf "Iter %d: %.8f\n" i x) (zip [0 :: Int ..] iters)

    if didConverge
      then printf "Root found: %.8f\n" (last iters)
      else putStrLn "Did not converge."
      -- Plotando o gráfico da função g(x) e da linha y = x
      let xs = [0,0.01..2]
        ys = map g xs
        identity = xs
        plotData = zip3 xs ys identity
        plotFile = "fixed_point_plot.csv"
      writeFile plotFile "x,g(x),y=x\n"
      mapM_ (\(x, y, idy) -> appendFile plotFile (printf "%.5f,%.5f,%.5f\n" x y idy)) plotData
      putStrLn $ "Plot data saved to " ++ plotFile
      putStrLn "Abra o arquivo CSV em um software de planilha ou use Python/gnuplot para visualizar o gráfico."