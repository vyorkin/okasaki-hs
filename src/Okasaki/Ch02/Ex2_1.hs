module Okasaki.Ch02.Ex2_1 where

suffixes :: [a] -> [[a]]
suffixes [] = [[]]
suffixes l@(_:xs) = l : suffixes xs

-- λ> suffixes [1, 2, 3, 4] :: [[Int]]
-- [[1,2,3,4],[2,3,4],[3,4],[4],[]]
