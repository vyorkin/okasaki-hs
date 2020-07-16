{-# LANGUAGE MultiParamTypeClasses #-}

module Okasaki.Ch02.Data.FiniteMap.Class
  ( FiniteMap(..)
  ) where

import Prelude hiding (lookup)

class Ord k => FiniteMap f k v where
  empty :: f k v
  insert :: k -> v -> f k v -> f k v
  lookup :: k -> f k v -> Maybe v
