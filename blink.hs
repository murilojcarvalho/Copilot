{-# LANGUAGE RebindableSyntax #-}

-- TEST 3 EXTERNAL VARIABLES AND 2 TRIGGERS
-- USING freeRTOS  

module Blink ( test ) where

import Language.Copilot
import Copilot.Compile.C99



led_b :: Stream Word8
led_b = extern "led_b" (Just [1..])

led_g :: Stream Word8
led_g = extern "led_g" (Just [2,4..])

led_r :: Stream Word8
led_r = extern "led_r" (Just [4,8..])


spec :: Spec
spec = do
	--Triggered by led_b=on and led_g=on simultaneously 
	--(*Obs: LEDs with common anode).
	trigger "trigger_bluegreen" (led_b==0 && led_g==0) []
	--Triggered by led_r=on only 
	--(*Obs: LEDs with common anode).
	trigger "trigger_red" (led_r==0) []


test :: IO ()
test = do 
  interpret 10 spec
  reify spec >>= compile "blink"