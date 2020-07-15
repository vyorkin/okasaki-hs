module Main where

import Test.Tasty (defaultMain, testGroup)

import qualified Test.Ch02 as Ch02 (tests)

main :: IO ()
main =
  defaultMain $
  testGroup "Okasaki"
    [ Ch02.tests
    ]
