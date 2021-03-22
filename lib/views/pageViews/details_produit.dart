import 'package:flutter/material.dart';
import 'package:mac_services/config/colors.dart';
import 'package:mac_services/models/produit.dart';
import 'package:toast/toast.dart';

class DetailProduit extends StatefulWidget {
  final ProduitModel produitModel;

  DetailProduit({this.produitModel});

  @override
  _DetailProduitState createState() => _DetailProduitState();
}

class _DetailProduitState extends State<DetailProduit> {

  int countAdd = 0;
  int prix = 0;


  void addInCart(){

    setState(() {
      countAdd ++ ;
      prix = int.parse(widget.produitModel.prixUn) * countAdd  ;
    });

  }

  void removeIn(){
      if (countAdd >= 1) {
        setState(() {
          countAdd-- ;
          prix = int.parse(widget.produitModel.prixUn) * countAdd  ;
        });

      } else {
        Toast.show("Vous ne pouvez réduire la quantité  !!!", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Hero(
                    tag: widget.produitModel.id,
                    child: Image.network(
                      'https://apihamilton.alwaysdata.net/vld/images/' +
                          widget.produitModel.image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      left: 10.0,
                      top: 40.0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: ColorsSys.red, shape: BoxShape.circle),
                        child: IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context)),
                      ))
                ],
              )),
          Expanded(
              child: Transform.translate(
                  offset: const Offset(0.0, -15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.produitModel.libelle,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(child: Text("Prix unitaire : ", style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.bold),)),
                              Flexible(child: Text(
                                "${widget.produitModel.prixUn} FCFA", style: TextStyle(color: ColorsSys.red, fontSize: 20.0, fontWeight: FontWeight.bold),)),
                            ],
                          ),
                          Flexible(
                              child: Text(
                            widget.produitModel.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.black54),
                            )
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width : 40,
                                    height: 40,
                                    decoration : BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 40.0,
                                          offset: Offset.zero
                                        )
                                      ],
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        iconSize: 25.0,
                                        color: ColorsSys.red,
                                        icon: Icon(Icons.remove),
                                         onPressed: (){
                                           removeIn();
                                         }),
                                    ),
                                  ),
                                  SizedBox(width: 20.0),
                                  Text(countAdd.toString(), style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold)),
                                  SizedBox(width: 20.0),
                                  Container(
                                    width : 40,
                                    height: 40,
                                    decoration : BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 50.0,
                                              offset: Offset.zero
                                          )
                                        ],
                                        shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: IconButton(
                                          iconSize: 25.0,
                                          color: ColorsSys.red,
                                          icon: Icon(Icons.add),
                                          onPressed: (){
                                            addInCart();
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                              Flexible(child: Text(" $prix FCFA", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0 ),)),
                            ],
                          ),
                          Center(
                            child: OutlinedButton.icon(
                              icon: Icon(Icons.shopping_cart_outlined, color: ColorsSys.red),
                              label: Text("Ajouter au panier", style: TextStyle(color: ColorsSys.red, fontSize: 20, fontWeight: FontWeight.bold),),
                              onPressed: () => print("it's pressed"),
                              style: ElevatedButton.styleFrom(
                                shadowColor: ColorsSys.red,
                                side: BorderSide(width: 2.0, color: ColorsSys.red),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
