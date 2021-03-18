
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mac_services/models/categories.dart';
import 'package:mac_services/services/basics.dart';

class CategoriesServices {

  static Future<List<CategorieModel>> getAllCategories() async{

    List<CategorieModel> liste ;
    
    var request = await http.get(BasicInfo.BASIC_CATEGORIES);
    if(request.statusCode == 200){
      var response = jsonDecode(request.body);
      var datas = response["datas"];
      liste =  datas.map<CategorieModel>((json) => CategorieModel.fromJson(json)).toList();
      return liste;
    }else{
      return liste;
    }
  }
  
}