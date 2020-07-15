module Test.Ch02.Ex2_2 (tests) where

import Hedgehog (Property, property, (===), assert, forAll)

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.Hedgehog (testProperty)

tests :: TestTree
tests = testGroup "Ex2_2"
  [ testGroup "tree"
    [
    ]
  ]
