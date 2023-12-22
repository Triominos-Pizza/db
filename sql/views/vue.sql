
-- VUE DU GESTIONNAIRE -- 
CREATE OR REPLACE VIEW VoirStockIngredient
AS 
SELECT Ingredient.nomIngredient, valeurStock, uniteStock FROM Stock
INNER JOIN Ingredient ON Ingredient.idStock = Stock.idStock;

CREATE OR REPLACE VIEW VoirStockProduit
AS 
SELECT FicheProduit.nomProduit, valeurStock, uniteStock FROM Stock
INNER JOIN ProduitIndustriel ON ProduitIndustriel.idStock = Stock.idStock
INNER JOIN FicheProduit ON FicheProduit.idFicheProduit = ProduitIndustriel.idFicheProduit;

CREATE OR REPLACE VIEW AfficherToutesLesCommandes
AS
SELECT idCommande, CompteClient.nomClient, dateHeureCommande, montantFactureCommande 
FROM Commande
INNER JOIN CompteClient ON CompteClient.idClient = Commande.idClient;

CREATE OR REPLACE VIEW AfficherLesCommandesEnLivraison
AS
SELECT idCommande, CompteClient.nomClient, dateHeureCommande, montantFactureCommande 
FROM Commande
INNER JOIN CompteClient ON CompteClient.idClient = Commande.idClient
WHERE estEnLivraison = true;

CREATE OR REPLACE VIEW AfficherLesCommandesEnCours
AS
SELECT idCommande, CompteClient.nomClient, dateHeureCommande, montantFactureCommande 
FROM Commande
INNER JOIN CompteClient ON CompteClient.idClient = Commande.idClient
WHERE estPrete = false;

-- VUE DU LIVREUR --

CREATE OR REPLACE VIEW AfficherLesAdressesALivrer
AS
SELECT Commande.idCommande, numAdresse, rueAdresse, Ville.nomVille
FROM Adresse 
INNER JOIN Ville ON Adresse.idVille = Ville.idVille
INNER JOIN Livraison ON Livraison.idAdresse = Adresse.idAdresse
INNER JOIN Commande ON Commande.idLivraison  = Livraison.idLivraison 
WHERE Commande.estPrete = false AND Commande.dateHeureLivraison is null;
