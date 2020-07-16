module Okasaki.Ch02.Data.Tree
  ( Tree(..)
  ) where

import Control.DeepSeq (NFData, rnf)

data Tree a = E | T (Tree a) a (Tree a)
  deriving stock (Show)

instance NFData a => NFData (Tree a) where
  rnf E = ()
  rnf (T l x r) = rnf l `seq` rnf x `seq` rnf r
