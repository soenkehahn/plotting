import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Diagrams
import System.IO

main :: IO ()
main = do
  hPutStr stderr "plotting..."
  toFile def "plot.svg" $ do
    plot (line "f" [map (\ x -> (x, f x)) xs])
  hPutStrLn stderr "done"

xs = [from, from + step .. to]
  where
    from = -7
    to = 7
    step = 0.1

f :: Double -> Double
f = sin
