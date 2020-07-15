module Okasaki.Ch02.Data.UnbalancedSet
  ( UnbalancedSet(..)
  ) where

import Control.DeepSeq (NFData, rnf)

data UnbalancedSet a
  = E | T (UnbalancedSet a) a (UnbalancedSet a)
  deriving (Show)

-- The rnf name stands for “reduce to normal-form.”
-- It fully evaluates its argument and then returns ().
instance NFData a => NFData (UnbalancedSet a) where
  rnf E = ()
  rnf (T l x r) = rnf l `seq` rnf x `seq` rnf r

-- The idea is to just recursively apply `rnf` to
-- the components of the data type,
-- composing the calls to rnf together with seq.
