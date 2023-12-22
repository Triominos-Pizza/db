DELIMITER //
CREATE FUNCTION calculerPrixCommande(id INT)
RETURNS DECIMAL (15,2)
BEGIN
DECLARE
unProduit INT;
sonPrix DECIMAL(15,2);
prixProduitCommande DECIMAL (15,2);
prixMenuCommande DECIMAL (15,2);
Cursor listeProduits IS

SELECT idProduit, prixProduit INTO unProduit, sonPrix FROM FicheProduit fp
JOIN ProduitAchete pa ON pa.idFicheProduit = fp.idFicheProduit
JOIN ProduitCommande pc ON pc.idProdiutAchete = pa.idProdiutAchete*
-- Prix de la liste des ingrédients
SELECT SUM(prixProduit * quantite ) into prixProduitCommande FROM IngredientAjoutePizza
group by idVariantePizza

--Prix final = Prix de la liste des ingrédients + Sauce + Taille + Pate

END;
//
DELIMITER ;