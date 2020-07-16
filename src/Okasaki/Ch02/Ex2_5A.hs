module Okasaki.Ch02.Ex2_5A
  ( complete
  ) where

import Okasaki.Ch02.Data.Tree (Tree(..))

complete :: Ord a => a -> Int -> Tree a
complete x 0 = T E x (T E x E)
complete x 1 = T (T E x E) x (complete x 0)
complete x m = T (complete x (m - 2)) x (complete x (m - 1))
