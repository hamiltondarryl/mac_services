import 'package:flutter/material.dart';
import 'package:mac_services/config/colors.dart';
import 'package:mac_services/providers/cart_provider.dart';
import 'package:mac_services/services/categoriesServices.dart';
import 'package:mac_services/services/productServices.dart';
import 'package:mac_services/views/pageViews/search.dart';
import 'package:mac_services/widgets/card.dart';
import 'package:mac_services/widgets/icon_cart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curentIndex = 0;
  String curentCat = "";
  CartProvider _cartProvider;

  @override
  void initState() {
    super.initState();
    var datas = CategoriesServices.getAllCategories();
    datas.then((value) {
      setState(() {
        curentCat = value[0].id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bienvenue sur",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "roboto"),
                      ),
                      Text(
                        "Mac services",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "roboto"),
                      )
                    ],
                  ),
                  myAppBarIcon(data: _cartProvider.produits.length),
                ],
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Search())),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorsSys.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text("Rechercher ...",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FutureBuilder(
                      future: CategoriesServices.getAllCategories(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          );
                        }

                        var data = snapshot.data;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      curentIndex = index;
                                      curentCat = data[index].id;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].libelle,
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontFamily: "roboto",
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5),
                                        index == curentIndex
                                            ? Container(
                                                height: 3,
                                                width: 40,
                                                color: ColorsSys.red,
                                              )
                                            : SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.7,
                width: double.infinity,
                child: FutureBuilder(
                    future: ProduitServices.getProduits(curentCat),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        );
                      }
                      var data = snapshot.data;

                      if (data.length == 0) {
                        return Center(
                            child: Text("il n'y a pas de produits disponibles",
                                style: TextStyle(color: Colors.black87)));
                      }

                      return GridView.builder(
                          itemCount: data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0),
                          itemBuilder: (context, index) {
                            return customCard(
                                context: context,
                                id: data[index].libelle,
                                libelle: data[index].libelle,
                                description: data[index].description,
                                prix: data[index].prixUn,
                                pvente: data[index].pvente,
                                categorie: data[index].categorie,
                                image: data[index].image);
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
