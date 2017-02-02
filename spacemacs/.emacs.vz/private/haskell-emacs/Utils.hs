{-# LANGUAGE OverloadedStrings #-}

module Utils where

import           Foreign.Emacs
import           Control.Monad
import qualified Data.List     as L
import qualified Data.Text     as T
import Text.Printf
import Data.Hashable
import System.Console.ANSI

displayState :: String -> String -> String -> String
displayState st note pkg = ((printf "%-40s | %3s | %40s |" (c pkg pkg) (c pkg st) note) :: String)

intIndex :: String -> Int
intIndex s = mod (hash s) 8


c :: String -> String -> String
c p s = let sgrStart = SetColor Foreground Dull (colorIndex p)
            sgrEnd = Reset
            colorIndex :: String -> Color
            colorIndex s = toEnum (intIndex s)
        in
          setSGRCode [sgrStart] ++ s ++ setSGRCode [sgrEnd]

init' = displayState "▽ " ""
postInit' = displayState "▼ " ""

initn' n p = displayState "⌇ " n p 
postInitn' n p = displayState "⌇ " n p

end p = message $ T.pack $ displayState "◯ " "" p

init p = message $ T.pack $ init' p
postInit p = message $ T.pack $ postInit' p

initn p n = message $ T.pack $ initn' n p
postInitn p n = message $ T.pack $ postInitn' n p


message :: T.Text -> Emacs ()
message s = eval_ [Symbol "message", String s]

getVar :: T.Text -> Emacs Lisp
getVar s = eval [Symbol "identity", Symbol s]

getSVar :: T.Text -> Emacs T.Text
getSVar s = do
  sv <- getVar s;
  case sv of
    (String s') -> return s'
    _ -> error "Not a string"
