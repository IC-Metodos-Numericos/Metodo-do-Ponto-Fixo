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