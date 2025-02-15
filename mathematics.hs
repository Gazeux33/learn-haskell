

main :: IO ()
main = do
  let x = 10
  putStrLn $ "Start";
   -- putStrLn $ show $ factorial1 x

   putStrLn $ show $ product1 [1,2,3,4];
   putStrLn $ show $ product2 [1,2,3,4]




-- gcd :: Int -> Int -> Int : Calcul du plus grand commun diviseur.

--lcm :: Int -> Int -> Int : Calcul du plus petit commun multiple.



--factorial :: Int -> Int : Calcul de la factorielle d'un entier.
factorial1 :: Int -> Int
factorial1 0 = 1
factorial1 x = x * factorial1 (x - 1)







--fibonacci :: Int -> Int : Calcul de la suite de Fibonacci.

--primeFactors :: Int -> [Int] : Décomposition en facteurs premiers.

--isPrime :: Int -> Bool : Vérifie si un nombre est premier.

--sum :: Num a => [a] -> a : Somme d'une liste.

--product :: Num a => [a] -> a : Produit d'une liste.

product1 :: Num a => [a] -> a
product1 = foldl1 (*) 

product2 :: Num a => [a] -> a
product2 [] = 1
product2 (x:xs) = x * product2 xs



--mean :: (Fractional a) => [a] -> a : Moyenne d'une liste de nombres.