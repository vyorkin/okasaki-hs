module Test.Ch02 (tests) where

import Test.Tasty (TestTree, testGroup)

import qualified Test.Ch02.Ex2_1 as Ex2_1 (tests)
import qualified Test.Ch02.Ex2_2 as Ex2_2 (tests)

tests :: TestTree
tests = testGroup "Ch02"
  [ Ex2_1.tests
  , Ex2_2.tests
  ]
