import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mac_services/models/produit.dart';
import 'package:mac_services/services/basics.dart';

class ProduitServices {
  static Future<List<ProduitModel>> getProduits(String id) async {
    List<ProduitModel> liste;

    var request = await http.get(BasicInfo.BASIC_PRODUCT + id);
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      var datas = response["datas"];
      liste = datas
          .map<ProduitModel>((json) => ProduitModel.fromJson(json))
          .toList();
      return liste;
    } else {
      return liste;
    }
  }
}
