import Control.Monad
import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Diagrams

main :: IO ()
main = do
  toFile def "plot.svg" $ do
    renderFunctions f [0, 0.3, 0.5, 0.7, 0.9, 0.99]

renderFunctions f tweaks =
  forM_ tweaks $ \ tweak ->
    plot (line (show tweak) [map (\ x -> (x, f tweak x)) xs])

xs = [from, from + step .. to]
  where
    from = -1
    to = 1
    step = (to - from) / 100

f :: Double -> Double -> Double
f 0 x = x
f tweak x | x > 0 = - (((1 - tweak) ** x) - 1) / tweak
f tweak x | x < 0 = - f tweak (- x)
f tweak 0 = 0
