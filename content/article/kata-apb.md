---
title: "Kata APB"
date: '2017-11-18'
---

[Admission Post Bac](https://www.admission-postbac.fr/) (APB) est
l'application officielle du Ministère de l'Education Nationale permettant aux
lycéens d'obtenir l'inscription dans une école ou université post-
bac.

L'objectif de ce kata est de concevoir et implémenter _votre_ version de cette
application. Vous êtes libre de choisir votre algorithme et vos contraintes.
Vous pouvez vous inspirer de l'application existante ou bien inventer votre
propre approche.

## Description du problème

Constuisez un programme qui permette de déterminer les affectations d'une liste
d'étudiants selon une liste de formations disponibles.

Le programme doit accepter en entrée:

- La liste des étudiants
- La liste des formations

Chaque étudiant et chaque formation doit être identifiée par un nom unique.
Aafin d'alimenter votre algorithme, vous pouvez ajouter autant d'information
que nécessaire aussi bien aux étudiants qu'aux formations .

Le programme fournira en résultat une liste indiquant pour chaque étudiant la
formation qui lui a été affectée.

## Exemple

A titre d'exemple, nous vous proposons cette solution très simple implémentée
en [Haskell](https://www.haskell.org/).

- Il n'y a aucun critère de sélection pour l'entrée dans les formations;
- Nous distibuons les étudiants les uns après les autres sur la liste des formations disponibles;
- Le nombre de places par formations n'est pas limité.

{{< highlight haskell "style=github" >}}
import Test.Hspec

data Etudiant  = Etudiant  String deriving (Show, Eq)
data Formation = Formation String deriving (Show, Eq)


distribue :: [ a ] -> [ b ] -> [ (a,b) ]
distribue a [] = []
distribue a b =
  dist a b
  where
    dist [] x = []
    dist x [] = dist x b
    dist (xh : xt ) ( yh : yt ) = (xh, yh) : dist xt yt


apb :: [ Etudiant ] -> [ Formation ] -> [ (Etudiant, Formation) ]
apb etudiants formations =
  distribue etudiants formations


main = hspec $ do
  describe "apb" $ do

    it "distribue deux listes comme deux jeux de cartes" $ do
      distribue [1,2] [3] `shouldBe` [(1,3), (2,3)]
      distribue [1] [2,3] `shouldBe` [(1,2)]
      distribue ([] :: [Int]) [2,3] `shouldBe` []
      distribue [1]  ([] :: [Int])  `shouldBe` []
      distribue [1,2,3] [4,5,6] `shouldBe`
        [(1,4),
         (2,5),
         (3,6)]
      distribue [1,2,3] [4,5] `shouldBe`
        [(1,4),
         (2,5),
         (3,4)]

    it "reparti les etudiants sur les formations" $ do
      apb [e1,e2,e3] [f1, f2] `shouldBe`
        [(e1,f1),
         (e2,f2),
         (e3,f1)]
      where
        e1 = Etudiant "Jeanne"
        e2 = Etudiant "Mathilde"
        e3 = Etudiant "Sophie"
        f1 = Formation "Informatique"
        f2 = Formation "Histoire"

{{< / highlight >}}

Vous pouvez également consulter ce [repository git](https://github.com/BernardNotarianni/kata-apb) pour découvrir d'autres exemples de solutions.
