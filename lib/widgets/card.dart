import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mac_services/config/colors.dart';
import 'package:mac_services/helpers/functions.dart';

Widget customCard({libelle, description, prix, categorie, image}) {
  return GestureDetector(
    onTap: () {
      print(libelle);
    },
    child: Card(
      elevation: 15.0,
      shadowColor: ColorsSys.black.withOpacity(.1),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.network(
                'https://apihamilton.alwaysdata.net/vld/images/' + image),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(smallSentence(libelle, 30, 26),
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      "Prix : ",
                      style: TextStyle(
                          color: ColorsSys.red, fontWeight: FontWeight.bold),
                    ),
                    Text(prix + " FCFA"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
