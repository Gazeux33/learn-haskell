# Fonctions de base sur les listes

**```map``` :: (a -> b) -> [a] -> [b]** : Applique une fonction à chaque élément d'une liste.

**```filter``` :: (a -> Bool) -> [a] -> [a]** : Garde les éléments qui satisfont une condition.

**```foldr``` :: (a -> b -> b) -> b -> [a] -> b** : Réduit une liste de droite à gauche.

**```foldl``` :: (b -> a -> b) -> b -> [a] -> b** : Réduit une liste de gauche à droite.

**```concat``` :: [[a]] -> [a]** : Aplatie une liste de listes.

**```reverse``` :: [a] -> [a]** : Inverse une liste.

**```zip``` :: [a] -> [b] -> [(a, b)]** : Associe les éléments de deux listes.

**```unzip``` :: [(a, b)] -> ([a], [b])** : Sépare les paires en deux listes.

**```length``` :: [a] -> Int** : Renvoie la longueur d'une liste.

**```take``` :: Int -> [a] -> [a]** : Prend les n premiers éléments d'une liste.

**```drop``` :: Int -> [a] -> [a]** : Supprime les n premiers éléments d'une liste.

# Fonctions mathématiques

**```gcd``` :: Int -> Int -> Int** : Calcul du plus grand commun diviseur.

**```lcm``` :: Int -> Int -> Int** : Calcul du plus petit commun multiple.

**```factorial``` :: Int -> Int** : Calcul de la factorielle d'un entier.

**```fibonacci``` :: Int -> Int** : Calcul de la suite de Fibonacci.

**```primeFactors``` :: Int -> [Int]** : Décomposition en facteurs premiers.

**```isPrime``` :: Int -> Bool** : Vérifie si un nombre est premier.

**```sum``` :: Num a => [a] -> a** : Somme d'une liste.

**```product``` :: Num a => [a] -> a** : Produit d'une liste.

**```mean``` :: (Fractional a) => [a] -> a** : Moyenne d'une liste de nombres.


# Fonctions sur les chaînes de caractères

**```toUpperCase```:: String -> String** : Convertit une chaîne en majuscules.

**```toLowerCase``` :: String -> String** : Convertit une chaîne en minuscules.

**```words``` :: String -> [String]** : Divise une chaîne en mots.

**```unwords``` :: [String] -> String** : Réunit des mots en chaîne.

**```isPalindrome``` :: String -> Bool** : Vérifie si une chaîne est un palindrome.

**```reverseWords``` :: String -> String** : Inverse les mots d'une phrase.

**```strip``` :: String -> String** : Supprime les espaces de début et fin.


# Fonctions d’ordre supérieur

**```compose``` :: (b -> c) -> (a -> b) -> (a -> c)** : Composition de fonctions.

**```applyTwice``` :: (a -> a) -> a -> a** : Applique une fonction deux fois.

**```flip``` :: (a -> b -> c) -> b -> a -> c** : Inverse les arguments d'une fonction.

# Fonctions personnalisées utiles

**```isSorted``` :: Ord a => [a] -> Bool** : Vérifie si une liste est triée.

**```groupBy``` :: (a -> a -> Bool) -> [a] -> [[a]]** : Groupe des éléments similaires.

**```chunk``` :: Int -> [a] -> [[a]]** : Divise une liste en sous-listes de taille fixe.

**```flatten``` :: [[a]] -> [a]** : Équivaut à concat.

# Fonctions d'algorithmes classiques

**```binarySearch :: Ord a => a -> [a] -> Maybe Int** : Recherche binaire.

**```quickSort``` :: Ord a => [a] -> [a]** : Tri rapide.

**```mergeSort``` :: Ord a => [a] -> [a]** : Tri fusion.

**```bubbleSort``` :: Ord a => [a] -> [a]** : Tri à bulles.

# Fonctions d'entrées/sorties (IO)

**```printList``` :: Show a => [a] -> IO ()** : Affiche chaque élément d'une liste.

**```readInt``` :: IO Int** : Lit un entier depuis l'entrée standard.

**```readLines``` :: IO [String]** : Lit plusieurs lignes jusqu'à une ligne vide.

# Fonctions sur les listes et valeurs

**```head``` :: [a] -> a** : Retourne le premier élément d'une liste.

**```tail``` :: [a] -> [a]** : Retourne la liste sans son premier élément.

**```init``` :: [a] -> [a]** : Retourne la liste sans son dernier élément.

**```last``` :: [a] -> a** : Retourne le dernier élément d'une liste.

**```null``` :: [a] -> Bool** : Vérifie si une liste est vide.

**```maximum``` :: Ord a => [a] -> a** : Renvoie le plus grand élément d'une liste.

**```minimum``` :: Ord a => [a] -> a** : Renvoie le plus petit élément d'une liste.

**```sum``` :: Num a => [a] -> a** : Calcule la somme des éléments d'une liste.

**```product``` :: Num a => [a] -> a** : Calcule le produit des éléments d'une liste.

**```elem``` :: Eq a => a -> [a] -> Bool** : Vérifie si un élément appartient à une liste.

**```notElem``` :: Eq a => a -> [a] -> Bool** : Vérifie si un élément n'appartient pas à une liste.

# Fonctions numériques

**```abs``` :: Num a => a -> a** : Valeur absolue.

**```signum``` :: Num a => a -> a** : Renvoie le signe d'un nombre (-1, 0, 1).

**```div``` :: Integral a => a -> a -> a** : Division entière.

**```mod``` :: Integral a => a -> a -> a** : Modulo de la division entière.

**```quot``` :: Integral a => a -> a -> a** : Division entière (tronquée vers zéro).

**```rem``` :: Integral a => a -> a -> a** : Reste de la division entière (même signe que le dividende).

**```even``` :: Integral a => a -> Bool** : Vérifie si un nombre est pair.

**```odd``` :: Integral a => a -> Bool** : Vérifie si un nombre est impair.

**```gcd``` :: Integral a => a -> a -> a** : Plus grand commun diviseur.

**```lcm``` :: Integral a => a -> a -> a** : Plus petit commun multiple.

**```max``` :: Ord a => a -> a -> a** : Renvoie le plus grand des deux arguments.

**```min``` :: Ord a => a -> a -> a** : Renvoie le plus petit des deux arguments.

# Fonctions booléennes

**```and``` :: [Bool] -> Bool** : Vérifie que tous les éléments sont vrais.

**```or``` :: [Bool] -> Bool** : Vérifie qu'au moins un élément est vrai.

**```not``` :: Bool -> Bool** : Négation d'une valeur booléenne.

**```(&&)``` :: Bool -> Bool -> Bool**: Opérateur ET logique.

**```(||)``` :: Bool -> Bool -> Bool**: Opérateur OU logique.

# Fonctions pour les tuples

**```fst``` :: (a, b) -> a** : Retourne le premier élément d'un tuple.

**```snd``` :: (a, b) -> b** : Retourne le second élément d'un tuple.

**```swap``` :: (a, b) -> (b, a)** : Inverse les éléments d'un tuple.

# Fonctions utilitaires supplémentaires

**```repeat``` :: a -> [a]** : Génère une liste infinie avec le même élément.

**```cycle``` :: [a] -> [a]** : Génère une liste infinie en répétant la liste fournie.

**```replicate``` :: Int -> a -> [a]** : Crée une liste contenant plusieurs copies d'un élément.

**```zipWith``` :: (a -> b -> c) -> [a] -> [b] -> [c]** : Associe deux listes avec une fonction.

**```any``` :: (a -> Bool) -> [a] -> Bool** : Vérifie si au moins un élément satisfait une condition.

**```all``` :: (a -> Bool) -> [a] -> Bool** : Vérifie si tous les éléments satisfont une condition.