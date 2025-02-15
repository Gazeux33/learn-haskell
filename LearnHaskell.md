# Learn Haskell

 - [WebSite](https://lyah.haskell.fr/)

 ## Demarrons

 Compilé

 Fonctions Infixes != Fonctions préfixes 


### Simple functions
 ```hs
  succ 8  -- 9
  min 9 10
  max 100 101
 ```

 ### Declare functions 
 ```hs
 doubleMe x = x + x
 doubleUs x y = doubleMe x + doubleMe y
 ````
 ```hs
 doubleSmallNumber x = if x > 100
                        then x
                        else x*2
 ```

 ### String

 ```hs
 conanO'Brien = "It's a-me, Conan O'Brien!"
 ```

 ### List
  "hello" = ['h', 'e', 'l', 'l', 'o']
 ```hs
 lostNumbers = [4,8,15,16,23,42]
 [1,2,3,4] ++ [9,10,11,12] -- concat
 ```

 ```hs
 6:[1,2,3,4,5] --[6,1,2,3,4,5]
 ```

 ```hs
 head [5,4,3,2,1] -- 5
 tail [5,4,3,2,1] -- [4,3,2,1]
 last [5,4,3,2,1] -- 1
 init [5,4,3,2,1] -- [5,4,3,2]
 length [5,4,3,2,1] -- 5
 null [1,2,3] -- False
 reverse [5,4,3,2,1] -- [1,2,3,4,5]
 take 3 [5,4,3,2,1] -- [5,4,3]
 drop 3 [8,4,2,1,5,6] -- [1,5,6]
 minimum [8,4,2,1,5,6] -- 1
 maximum [1,9,2,3,4] -- 9
 sum [5,2,1,6,3,2,5,7] -- 31
 product [6,2,1,2] -- 24
 4 `elem` [3,4,5,6] -- True
 ```

 ```hs
 [1..10] -- [1,2,3,4,5,6,7,8,9,10]
 ['a'..'z'] -- "abcdefghijklmnopqrstuvwxyz"
 [2,4..20] -- [2,4,6,8,10,12,14,16,18,20]
 cycle [1,2,3] -- [1,2,3,1,2,3,1,2,3,1] ∞
 repeat 5 -- [5,5,5,5,5,5,5,5,5,5] ∞
 ```

 ```hs
 [x*2 | x <- [1..10]] -- [2,4,6,8,10,12,14,16,18,20]

 [x*2 | x <- [1..10], x*2 >= 12] -- [12,14,16,18,20]

 [ x | x <- [10..20], x /= 13, x /= 15, x /= 19] -- [10,11,12,14,16,17,18,20]

 [ x*y | x <- [2,5,10], y <- [8,10,11]] -- [16,20,22,40,50,55,80,100,110]
 ```

 ```hs
 length' xs = sum [1 | _ <- xs]

 removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
 ```


 ### Tuple

 number of elements determined

 ```hs
 fst (8,11) -- 8
 snd (8,11) -- 11
 ```

 ## Types et classes de types

 type statique

 inference de type

 ```hs
 :t 'a' -- 'a' :: Char
 :t True -- True :: Bool
 :t "HELLO!" -- "HELLO!" :: [Char]
 ```

 ```hs
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- larger numbers 
factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r
 ```

 ### Variables de type
commence par une minuscule

fonctions polymorphiques

 ```hs
 :t head -- head :: [a] -> a

 :t fst -- fst :: (a, b) -> a
 ```

 ### Classes de types 101

 Interface de type

 ```hs
 :t (==) -- (==) :: (Eq a) => a -> a -> Bool

 :t elem -- elem :: (Eq a) => a -> [a] -> Bool

 :t (>) -- (>) :: (Ord a) => a -> a -> Bool
 ```

 ```hs
 Eq => (==)
 Ord => GT, LT,EQ
 Show => show 3 -- "3"
 Read => read "5" :: Int
 Enum  => succ,pred
 Bounded
 Num
 Integral
 ```

 ```hs
 :t (*) -- (*) :: (Num a) => a -> a -> a
 ```

 ## Syntaxe des fonctions

 ### Filtrage par motif 

l'orde est important 
 ```hs
 sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"
 ```

 ```hs
 factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)
 ```

 ```hs
 addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
 ```

 ```hs
 first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z
 ```

 ```hs
 head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
 ```

 ```hs
 length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs
 ```

 ```hs
capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
 ```

 ### Gardes, gardes !

 ```hs
 bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"


bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise 

 ```

 ```hs

 max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT
 ```



 ```hs
 bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2


bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

 ```

 ```hs
 initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname
 ```

 ```hs
 calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

 ```

 ### Let it be 

 Les liaisons where sont une construction syntaxique permettant de lier des variables en fin de fonction, visibles depuis toute la fonction, y compris les gardes

 Les liaisons let vous permettent de lier à des variables n’importe où, et sont elles-mêmes des expressions, mais très locales, donc elles ne sont pas visibles à travers les gardes

```let <bindings> in <expression>```
 ```hs 

 cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in  sideArea + 2 * topArea
 ```
## Récursivité

```hs
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs


maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
```

```hs
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0   = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs
```

```hs
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]
```

```hs
repeat' :: a -> [a]
repeat' x = x:repeat' x
```

```hs
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x    = True
    | otherwise = a `elem'` xs
```

## Fonctions d’ordre supérieur

### Fonctions curryfiées

Toutes les fonctions n'acceptent que 1 seul parametre.
=> fonctions curryfiées

```hs
max :: (Ord a) => a -> a -> a
max 4 5

max :: (Ord a) => a -> (a -> a)
(max 4) 5
```

si on appelle une fonction avec trop peu de paramètres, on obtient une fonction appliquée partiellement, c’est à dire une fonction qui prend autant de paramètres qu’on en a oubliés

```hs
isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])
```

### À l’ordre du jour : de l’ordre supérieur

```hs
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

applyTwice (+3) 10 --16
applyTwice (++ " HAHA") "HEY" --"HEY HAHA HAHA" 
```

```hs
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

zipWith' (+) [4,2,5,6] [2,6,2,3] --[6,8,7,9]
```

```hs
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x


flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y
```

### Maps et filtres

```hs
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs
```

```hs
filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs)
    | p x       = x : filter p xs
    | otherwise = filter p xs
```

```hs
sum (takeWhile (<10000) (filter odd (map (^2) [1..]))) --somme de tous les carrés impairs inférieurs à 10 000
```

```hs
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n =  n:chain (n `div` 2)
    | odd n  =  n:chain (n*3 + 1)
```

```hs
let listOfFuns = map (*) [0..]
(listOfFuns !! 4) 5
```

### Lambdas

```hs
numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
```

```hs
zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]
```

### Plie mais ne rompt pas

Elles sont un peu comme la fonction map, seulement qu’elles réduisent une liste à une valeur unique

```hs
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs


sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0
```

```hs
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs
```

```hs
maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)
```

```scanl``` et ```scanr``` sont comme ```foldl``` et ```foldr```, mais rapportent tous les résultats intermédiaires de l’accumulateur sous forme d’une liste. Il existe aussi ```scanl1``` et ```scanr1```, analogues à ```foldl1``` et ```foldr1```


### Appliquer des fonctions avec $

```hs
 sum (map sqrt [1..130])
  sum $ map sqrt [1..130]
```

```hs
map ($ 3) [(4+), (10*), (^2), sqrt]
```

### Composition de fonctions

```hs
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)
```

```hs
map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]

map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
```

**f (g (z x)) est équivalente à (f . g . z) x**


```hs
sum' :: (Num a) => [a] -> a
sum' xs = foldl (+) 0 xs

sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0
```
 ```hs
 fn x = ceiling (negate (tan (cos (max 50 x))))

 fn = ceiling . negate . tan . cos . max 50
 ```

 ## Modules

 ### Charger des modules

 Un module Haskell est une collection de fonctions,

 module Prelude  qui est importé par défaut.

 import ```<module name>```

```hs
import Data.List
import Data.List (nub, sort) --selection
import Data.List hiding (nub) --exclusion

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub
```

```hs
import qualified Data.Map

Data.Map.filter
```

```hs
import qualified Data.Map as M

M.filter
```



[Explorer les modules](https://downloads.haskell.org/ghc/latest/docs/libraries/)

[Pour trouver des fonctions et savoir dans quel module elles résident](https://hoogle.haskell.org/)

### Data.List
### Data.Char
### Data.Map


```hs
findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs) = if key == k
                            then Just v
                            else findKey key xs
```

### Data.Set

### Creer nos propres modules 

```hs
module Geometry
( sphereVolume
, sphereArea
, cubeVolume
, cubeArea
, cuboidArea
, cuboidVolume
) where

sphereVolume :: Float -> Float
sphereVolume radius = (4.0 / 3.0) * pi * (radius ^ 3)

sphereArea :: Float -> Float
sphereArea radius = 4 * pi * (radius ^ 2)

cubeVolume :: Float -> Float
cubeVolume side = cuboidVolume side side side

cubeArea :: Float -> Float
cubeArea side = cuboidArea side side side

cuboidVolume :: Float -> Float -> Float -> Float
cuboidVolume a b c = rectangleArea a b * c

cuboidArea :: Float -> Float -> Float -> Float
cuboidArea a b c = rectangleArea a b * 2 + rectangleArea a c * 2 + rectangleArea c b * 2

rectangleArea :: Float -> Float -> Float
rectangleArea a b = a * b
```

Aussi la possiblité de creer un dossier avec edes sous modules

## Créer nos propres types et classes de types


### Introduction aux types de données algébriques

```hs
data Bool = False | True
data Int = -2147483648 | -2147483647 | ... | -1 | 0 | 1 | 2 | ... | 2147483647
```

```hs
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
```

```hs
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)
```

Circle n'est pas un type , Shape en est un

```hs
surface $ Circle 10 20 10
surface $ Rectangle 0 0 100 100
```

```hs
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
```


```hs
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)
```
Remarquez qu’en définissant un point, on a utilisé le même nom pour le type de données et pour le constructeur de valeurs

```hs
surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)
```

```hs
module Shapes
( Point(..)
, Shape(..)
, surface
, nudge
, baseCircle
, baseRect
) where
```

### Syntaxe des enregistrements

```hs
data Person = Person String String Int Float String String deriving (Show)

firstName :: Person -> String
firstName (Person firstname _ _ _ _ _) = firstname

lastName :: Person -> String
lastName (Person _ lastname _ _ _ _) = lastname

age :: Person -> Int
age (Person _ _ age _ _ _) = age

height :: Person -> Float
height (Person _ _ _ height _ _) = height

phoneNumber :: Person -> String
phoneNumber (Person _ _ _ _ number _) = number

flavor :: Person -> String
flavor (Person _ _ _ _ _ flavor) = flavor
```

```hs
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)
```

```hs
data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)
Car {company="Ford", model="Mustang", year=1967}
```
 
 ### Paramètres de types@&ze  -$`)m=('§è)