module Main where

import Copilot.Language
import Copilot.Language.Reify
import qualified Copilot.Compile.C99 as C
import qualified Prelude as P

maxV = 500

running :: Stream Bool
running = extern "running" Nothing

temp = extern "temp" Nothing
  
temps :: Stream Float
temps = [maxV, maxV, maxV] ++ temp

spec :: Spec
spec = do
  observer "debug_temps" temps
  trigger "trigger1" (overTempRise && running) []
  where
    overTempRise :: Stream Bool
    overTempRise = drop 2 temps > (2.3 + temps)

main :: IO ()
main = do
  reify spec >>= C.compile C.defaultParams
