module FunctionCompose where

import Data.List (isPrefixOf)

dlts :: String -> [String]
dlts = foldr step [] . lines -- the use of (.) with foldr
            where step l ds
                    | "#define DLT_" `isPrefixOf` l = secondWord l : ds
                    | otherwise                     = ds
                  secondWord = head . tail . words

