
CREATE OR REPLACE FUNCTION CalculDuProduitAcheter 



FicheProduit > RecettePizza > VariantePizza > IngredientAjoutePizza > Ingredient 
FicheProduit > idRecettePizza > idVariantePizza > idIngredient > prix 





JOIN RecettePizza ON  

JOIN ProduitCommande ON idProduitAchete  
JOIN ProduitAchete ON idFicheProduit 
JOIN FicheProduit ON prixProduit

CREATE OR REPLACE FUNCTION PrixVaraiantePizza


SELECT prixSupplementBase INTO FROM BaseSaucePizza WHERE idSauce = 

JOIN Ingredient ON Ingredient.idIngredient = IngredientAjoutePizza.idIngredient
JOIN IngredientAjoutePizza ON VariantePizza.idVariantePizza = IngredientAjoutePizza.idVariantePizza 
JOIN PatePizza ON Pate.idPate = VariantePizza.idPate
JOIN Taille ON Pate.idTaille = VariantePizza.idTaille
JOIN BaseSaucePizza  ON Pate.idSauce  = VariantePizza.idSauce 
