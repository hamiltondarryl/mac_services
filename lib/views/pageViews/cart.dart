import 'package:flutter/material.dart';
import 'package:mac_services/config/colors.dart';
import 'package:mac_services/models/produit.dart';
import 'package:mac_services/providers/cart_provider.dart';
import 'package:mac_services/views/pageViews/commander_no_user.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartProvider _cartProvider;

  void addCountItem(ProduitModel item) {
    int currentValue = int.parse(item.quantite);
    currentValue++;
    int currentPvent = currentValue * int.parse(item.prixUn);
    setState(() {
      item.quantite = currentValue.toString();
      item.pvente = currentPvent.toString();
      _cartProvider.addProduit(item);
    });
  }

  void removeCountItem(ProduitModel item) {
    int currentValue = int.parse(item.quantite);

    if (currentValue >= 1) {
      currentValue--;
      int currentPvent = currentValue * int.parse(item.prixUn);
      setState(() {
        item.quantite = currentValue.toString();
        item.pvente = currentPvent.toString();
        _cartProvider.addProduit(item);
      });
    } else {
      Toast.show("Vous ne pouvez réduire la quantité  !!!", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    _cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsSys.black,
        centerTitle: true,
        title: Text(
          "Votre panier",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Le coût total : ",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Text(
                  " ${_cartProvider.getTotalPrice()} FCFA ",
                  style: TextStyle(
                      color: ColorsSys.red,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 6,
              child: _cartProvider.produits.length == 0
                  ? Center(
                      child: Text(
                      "Votre panier est vide",
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ))
                  : ListView.builder(
                      itemCount: _cartProvider.produits.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 15.0,
                          shadowColor: ColorsSys.black.withOpacity(.1),
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            'https://apihamilton.alwaysdata.net/vld/images/' +
                                                _cartProvider
                                                    .produits[index].image))),
                              ),
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                        _cartProvider.produits[index].libelle,
                                        style: TextStyle(
                                          color: Colors.black87,
                                        )),
                                  ),
                                  IconButton(
                                      color: Colors.red,
                                      iconSize: 25.0,
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        print("remove");
                                        _cartProvider.removeProduit(
                                            _cartProvider.produits[index]);
                                      })
                                ],
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${_cartProvider.produits[index].pvente} FCFA",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 40.0,
                                                    offset: Offset.zero)
                                              ],
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: IconButton(
                                                iconSize: 25.0,
                                                color: ColorsSys.red,
                                                icon: Icon(Icons.remove),
                                                onPressed: () {
                                                  removeCountItem(_cartProvider
                                                      .produits[index]);
                                                }),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          _cartProvider
                                              .produits[index].quantite,
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 40.0,
                                                    offset: Offset.zero)
                                              ],
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: IconButton(
                                                iconSize: 25.0,
                                                color: ColorsSys.red,
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  addCountItem(_cartProvider
                                                      .produits[index]);
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
      floatingActionButton: _cartProvider.produits.length == 0
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CommandeNoUser()));
              },
              label: Text('Commander'),
              icon: Icon(Icons.assignment_turned_in_rounded),
              backgroundColor: ColorsSys.red,
            ),
    );
  }
}
