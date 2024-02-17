module Utils where

import System.Random (RandomGen, Random (randomR))

makeSet :: Eq a => [a] -> [a]
makeSet = foldl (\res h -> if h `elem` res then res else res ++ [h]) []

digitToInt :: Char -> Int
digitToInt digit = toEnum $ fromEnum digit - fromEnum '0'

stringToInt :: String -> Int
stringToInt = foldl ((+) . (*10)) 0 . map digitToInt

elemIndex :: Eq t => t -> [t] -> Maybe Int
elemIndex e list = elemIndexIter e list 0
    where elemIndexIter :: Eq t => t -> [t] -> Int -> Maybe Int
          elemIndexIter _ [] _ = Nothing
          elemIndexIter e (x:xs) index
            | e == x = Just index
            | otherwise = elemIndexIter e xs (index + 1)

generateRandomNumber :: RandomGen a => a -> Int -> Int -> Int
generateRandomNumber generator from to = fst $ randomR (from, to) generator