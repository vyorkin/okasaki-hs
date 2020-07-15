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

-- complete :: Ord a => a -> Int -> Tree a
-- complete x 0 = T E x (T E x E)
-- complete x 1 = T (T E x E) x (complete x 0)
-- complete x m = T (complete x (m - 2)) x (complete x (m - 1))

-- λ> complete 'x' 5
-- T (T (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E)))
--      'x'
--      (T (T E 'x' (T E 'x' E))
--         'x'
--         (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E)))))
--   'x'
--   (T (T (T E 'x' (T E 'x' E))
--         'x'
--         (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E))))
--      'x'
--      (T (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E)))
--         'x'
--         (T (T E 'x' (T E 'x' E))
--            'x'
--            (T (T E 'x' E) 'x' (T E 'x' (T E 'x' E))))))

-- complete' :: Ord a => a -> Int -> Tree a
-- complete' _ 0 = error "Zero depth given"
-- complete' x 1 = leaf x
-- complete' x m = T (complete' x (m - 1)) x E

-- insert :: Ord a => a -> Tree a -> Tree a
-- insert x E = T E x E
-- insert x node@(T l v r)
--   | x < v = T (insert x l) v r
--   | x > v = T l v (insert x r)
--   | otherwise = node

-- Ex. 2.3 (CPS)
-- insert' :: forall a. Ord a => a -> Tree a -> Tree a
-- insert' x E           = leaf x
-- insert' x t@(T _ v _) = ins v id t
--   where
--     ins :: a -> (Tree a -> Tree a) -> Tree a -> Tree a
--     ins y cont E
--       | x == y    = t
--       | otherwise = cont (leaf x)
--     ins y cont (T l z r)
--       | x < y     = ins y (\l' -> cont (T l' z r )) l
--       | otherwise = ins z (\r' -> cont (T l  z r')) r

-- λ> let t1 = complete 5 0 :: Tree Int
-- λ> t1 & insert' 7 & insert' 3 & insert' 1 & insert' 9
-- T (T (T E 1 E) 3 E) 5 (T E 5 (T E 7 (T E 9 E)))
