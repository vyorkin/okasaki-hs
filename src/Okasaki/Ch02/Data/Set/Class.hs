{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Okasaki.Ch02.Data.Set.Class
  ( Set(..)
  ) where

import Okasaki.Ch02.Data.UnbalancedSet (UnbalancedSet(..))

class Set f a where
  empty  :: f a
  insert :: a -> f a -> f a
  member :: a -> f a -> Bool

instance Ord a => Set UnbalancedSet a where
  empty = E

  insert x E = T E x E
  insert x node@(T l v r)
    | x < v = T (insert x l) v r
    | x > v = T l v (insert x r)
    | otherwise = node

  member _ E = False
  member x (T l v r)
    | x < v = member x l
    | x > v = member x r
    | otherwise = True
