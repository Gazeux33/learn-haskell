
main :: IO ()
main = do
    putStrLn $ show $ isSorted1 [1,2,3,4]




-- isSorted :: Ord a => [a] -> Bool : Vérifie si une liste est triée

isSorted1 :: Ord a => [a] -> Bool
isSorted1 [] = True
isSorted1 [_] = True
isSorted1 (x1:x2:xs) = (x1 <= x2) && isSorted1 (x2:xs)