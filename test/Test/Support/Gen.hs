module Test.Support.Gen
  ( intL
  ) where

import Hedgehog (Gen)
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range

intL :: Gen [Int]
intL =
  Gen.list r1 (Gen.int r2) where
  r1 = Range.linear 0 10
  r2 = Range.linear 0 100
