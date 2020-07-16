{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Okasaki.Ch02.Ex2_2
  ( Ex2_2(..)
  ) where

import Okasaki.Ch02.Data.Set.Class (Set(..))
import Okasaki.Ch02.Data.UnbalancedSet (UnbalancedSet(..))

newtype Ex2_2 a = Ex2_2 { un :: UnbalancedSet a }

instance (Ord a, Bounded a) => Set Ex2_2 a where
  empty = Ex2_2 E
  insert x = Ex2_2 . insert x . un
  member x = mem minBound x . un where
    mem z e E = e == z
    mem _ e (T l y r)
      | x <= y    = mem y e l
      | otherwise = mem y e r

-- λ> let t1 = complete 5 0 :: Tree Int
-- λ> t1 & insert' 7 & insert' 3 & insert' 1 & insert' 9
-- T (T (T E 1 E) 3 E) 5 (T E 5 (T E 7 (T E 9 E)))
