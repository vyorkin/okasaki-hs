{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Okasaki.Ch02.Ex2_3
  ( Ex2_3(..)
  ) where

import Okasaki.Ch02.Data.Set.Class (Set(..))
import Okasaki.Ch02.Data.UnbalancedSet (UnbalancedSet(..))

newtype Ex2_3 a = Ex2_3 { un :: UnbalancedSet a }

instance Ord a => Set Ex2_3 a where
  empty = Ex2_3 E
  member x = member x . un
  insert x = Ex2_3 . insert x . un
