import 'package:flutter/foundation.dart';
import 'package:mac_services/models/produit.dart';

class CartProvider with ChangeNotifier {
  List<ProduitModel> _produits = [];
  // ignore: unnecessary_getters_setters
  List<ProduitModel> get produits => _produits;
  // ignore: unnecessary_getters_setters
  set produits(List<ProduitModel> value) => _produits = value;

  // Fonction d'ajout au panier
  addProduit(ProduitModel produit) {
    bool isNew = true;
    _produits.forEach((ProduitModel f) {
      if (f.id == produit.id) {
        isNew = false;
        return;
      }
    });
    if (isNew) _produits.add(produit);
    notifyListeners();
  }

  //Fonction pour retire un produit du panier
  removeProduit(produit) {
    _produits.remove(produit);
    notifyListeners();
  }

  // Fonction duy calcul total
  double getTotalPrice() {
    double total = 0;
    if (_produits != null) {
      _produits.forEach((f) {
        total += int.parse(f.pvente);
      });
    }
    return total;
  }
}
