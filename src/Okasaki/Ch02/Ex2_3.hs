{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

-- {-# OPTIONS_GHC -ddump-deriv #-}

module Okasaki.Ch02.Ex2_3
  ( Ex2_3(..)
  , Ex2_3CPS(..)
  ) where

import Control.DeepSeq (NFData)

import Okasaki.Ch02.Data.Set.Class (Set(..))
import Okasaki.Ch02.Data.UnbalancedSet (UnbalancedSet(..))

newtype Ex2_3 a = Ex2_3 (UnbalancedSet a)
  deriving newtype (NFData)

instance Ord a => Set Ex2_3 a where
  empty               = Ex2_3 E
  member x (Ex2_3 xs) = member x xs
  insert x (Ex2_3 xs) = Ex2_3 (insert x xs) -- TODO

newtype Ex2_3CPS a = Ex2_3CPS (UnbalancedSet a)
  deriving newtype NFData

instance Ord a => Set Ex2_3CPS a where
  empty                  = Ex2_3CPS E
  member x (Ex2_3CPS xs) = member x xs
  insert x (Ex2_3CPS xs) = Ex2_3CPS (go xs) where
    go E           = T E x E
    go t@(T _ v _) = ins v id t
      where
        ins y cont E
          | x == y    = t
          | otherwise = cont (T E x E)
        ins y cont (T l z r)
          | x < y     = ins y (\l' -> cont (T l' z r )) l
          | otherwise = ins z (\r' -> cont (T l  z r')) r
