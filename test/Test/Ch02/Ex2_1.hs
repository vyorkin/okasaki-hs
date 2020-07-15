module Test.Ch02.Ex2_1 (tests) where

import Data.List (isSuffixOf)

import Hedgehog (Property, property, (===), assert, forAll)

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.Hedgehog (testProperty)

import qualified Test.Support.Gen as Gen
import Okasaki.Ch02.Ex2_1 (suffixes)

prop_length :: Property
prop_length = property do
  l <- forAll Gen.intL
  length l + 1 === length (suffixes l)

prop_empty :: Property
prop_empty = property do
  l <- forAll Gen.intL
  assert $ [] `isSuffixOf` l

tests :: TestTree
tests = testGroup "Ex2_1"
  [ testGroup "suffix"
    [ testProperty "length" prop_length
    , testProperty "empty" prop_empty
    ]
  ]
