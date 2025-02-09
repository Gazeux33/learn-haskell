{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use print" #-}
main :: IO ()
main = do
  let l = [1,2,3,4,5,6]
  --putStrLn $ show $ map1 (3+) l
  --putStrLn $ show $ map2 (3+) l
  --putStrLn $ show $ map3 (3+) l

  --putStrLn $ show $ filter1 odd l
  --putStrLn $ show $ filter2 odd l
  --putStrLn $ show $ filter3 odd l

  putStrLn $ show $ foldl' (+) 0 l
  putStrLn $ show $ foldr' (+) 0 l
  putStrLn $ show $ foldl1' (+) l




--map :: (a -> b) -> [a] -> [b] : Applique une fonction à chaque élément d'une liste.

map1 :: (a -> b) -> [a] -> [b]
map1 _ [] = []
map1 f (x:xs) = f x : map1 f xs

map2 :: (a -> b) -> [a] -> [b]
map2 f xs = foldr (\x acc -> f x : acc ) [] xs

map3 :: (a -> b) -> [a] -> [b]
map3 f xs = [f x | x <- xs]

--filter :: (a -> Bool) -> [a] -> [a] : Garde les éléments qui satisfont une condition.

filter1 :: (a -> Bool) -> [a] -> [a]
filter1 _ [] = []
filter1 f (x:xs) = if f x then x:filter1 f xs else filter1 f xs

filter2 :: (a -> Bool) -> [a] -> [a]
filter2 f xs = foldr (\x acc -> if f x then x:acc else acc) [] xs

filter3 :: (a -> Bool) -> [a] -> [a]
filter3 f xs = [x | x <- xs , f x]

--foldl :: (b -> a -> b) -> b -> [a] -> b : Réduit une liste de gauche à droite.
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ acc [] = acc
foldl' f acc (x:xs) = foldl' f (f acc x) xs


--foldr :: (a -> b -> b) -> b -> [a] -> b : Réduit une liste de droite à gauche.
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ acc [] = acc
foldr' f acc (x:xs) = f x (foldr' f acc xs)


foldl1' :: (a -> a -> a) -> [a] -> a
foldl1' f (x:xs) = foldl f x xs



