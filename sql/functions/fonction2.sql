-- CREATE OR REPLACE FUNCTION CalculDuProduitAcheter 



-- -- FicheProduit > RecettePizza > VariantePizza > IngredientAjoutePizza > Ingredient 
-- -- FicheProduit > idRecettePizza > idVariantePizza > idIngredient > prix 





-- JOIN RecettePizza ON  

-- JOIN ProduitCommande ON idProduitAchete  
-- JOIN ProduitAchete ON idFicheProduit 
-- JOIN FicheProduit ON prixProduit

DELIMITER //

CREATE OR REPLACE FUNCTION PrixVariantePizza(PizzaChoisie INT) RETURNS DECIMAL (5,2)
BEGIN 
DECLARE total DECIMAL (10,2);
SELECT SUM(prixProduit) INTO total FROM FicheProduit WHERE VariantePizza.idFicheProduit = idFicheProduit AND VariantePizza.idVariantePizza = PizzaChoisie;
SELECT total + SUM(prixSupplementPate) INTO total FROM PatePizza WHERE VariantePizza.idPate = idPate AND VariantePizza.idVariantePizza = PizzaChoisie;
SELECT total + SUM(prixSupplementBase) INTO total FROM BaseSaucePizza WHERE VariantePizza.idSauce = idSauce AND VariantePizza.idVariantePizza = PizzaChoisie;
SELECT total + SUM(prixSupplementTaille) INTO total FROM TaillePizza WHERE VariantePizza.idTaille = idTaille AND VariantePizza.idVariantePizza = PizzaChoisie;

Return total;
END // 

DELIMITER //

CREATE OR REPLACE FUNCTION PrixDesIngredientsAjoutés(PizzaChoisie INT) RETURNS DECIMAL(5,2)
BEGIN 
DECLARE total DECIMAL (10,2);
SELECT SUM(prixVenteIngredient) INTO total FROM Ingredient WHERE idIngredient = IngredientAjoutePizza.IdIngredient 
AND IngredientAjoutePizza.idVariantePizza = PizzaChoisie;

Return total;
END // 











-- SELECT prixSupplementBase INTO FROM BaseSaucePizza WHERE idSauce = 

-- JOIN Ingredient ON Ingredient.idIngredient = IngredientAjoutePizza.idIngredient
-- JOIN IngredientAjoutePizza ON VariantePizza.idVariantePizza = IngredientAjoutePizza.idVariantePizza 
-- JOIN PatePizza ON Pate.idPate = VariantePizza.idPate
-- JOIN Taille ON Pate.idTaille = VariantePizza.idTaille
-- JOIN BaseSaucePizza  ON Pate.idSauce  = VariantePizza.idSauce 