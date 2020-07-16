{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Okasaki.Ch02.Ex2_6
  ( Ex2_6(..)
  ) where

import Prelude hiding (lookup)
import Control.DeepSeq (NFData)

import qualified Okasaki.Ch02.Data.Set.Class as Set
import Okasaki.Ch02.Data.FiniteMap.Class (FiniteMap(..))
import Okasaki.Ch02.Data.UnbalancedSet (UnbalancedSet(..))

newtype Ex2_6 k v = Ex2_6 { un :: UnbalancedSet (k, v) }
  deriving newtype (NFData)

instance (Ord k, Ord v) => FiniteMap Ex2_6 k v where
  empty = Ex2_6 Set.empty
  insert k v = Ex2_6 . Set.insert (k, v) . un
  lookup _ (Ex2_6 E) = Nothing
  lookup k (Ex2_6 (T l (k', v) r))
    | k < k'    = lookup k (Ex2_6 l)
    | k > k'    = lookup k (Ex2_6 r)
    | otherwise = Just v
