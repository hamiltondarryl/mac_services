import 'package:flutter/material.dart';
import 'package:mac_services/config/colors.dart';
import 'package:mac_services/config/image.dart';
import 'package:mac_services/views/pageViews/profil.dart';
import 'package:toast/toast.dart';

class CommandeNoUser extends StatefulWidget {
  @override
  _CommandeNoUserState createState() => _CommandeNoUserState();
}

class _CommandeNoUserState extends State<CommandeNoUser> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nom = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController commune = TextEditingController();
  TextEditingController quartier = TextEditingController();
  TextEditingController livraison = TextEditingController();

  bool check = true;

  @override
  Widget build(BuildContext context) {
    var dim = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        width: double.infinity,
        height: dim.height,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Image.asset(
                      ImageSys.logo,
                      height: 60.0,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                    "Vous pouvez créer un compte pour éviter de remplir ce formulaire à chaque commande,",
                    style: new TextStyle(color: Colors.black87, fontSize: 17.0),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()))
                  },
                  child: Text(
                    "Créer un compte",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorsSys.red,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Nom Complet",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez entrer un nom complet";
                              }
                              return null;
                            },
                            controller: nom,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 20.0, color: ColorsSys.grey),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                filled: true,
                                hintText: "Veuillez entrer votre nom complet"),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Contact ",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          width: double.infinity,
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez entrer un numéro de téléphone";
                              } else if (value.length < 9) {
                                return "Votre mot de passe doit avoir minimum 9 caractéres";
                              }
                              return null;
                            },
                            controller: contact,
                            decoration: InputDecoration(
                                hoverColor: Colors.grey,
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 20.0, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                filled: true,
                                hintText:
                                    "Veuillez entrer votre numéro de téléphone"),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Commune",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez entrer un commune";
                              }
                              return null;
                            },
                            controller: commune,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 20.0, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                filled: true,
                                hintText:
                                    "Veuillez entrer votre commune actelle"),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Quartier",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez entrer quartier actuel ";
                              }
                              return null;
                            },
                            controller: quartier,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 20.0, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                filled: true,
                                hintText:
                                    "Veuillez entrer votre  quartier actuel "),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Lieu de livraison",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veuillez entrer oû vous souhaitez être livré";
                              }
                              return null;
                            },
                            controller: livraison,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      width: 20.0, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                filled: true,
                                hintText:
                                    "Veuillez entrer oû vous souhaitez être livré "),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        check
                            ? Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: double.infinity,
                                // ignore: deprecated_member_use
                                child: new RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60.0),
                                    ),
                                    color: ColorsSys.redSy,
                                    child: Text(
                                      "Passer la commande",
                                      style: new TextStyle(
                                          color: Colors.white, fontSize: 17.0),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        Toast.show(
                                            "Pas disponible pour le moment",
                                            context,
                                            duration: Toast.LENGTH_SHORT,
                                            gravity: Toast.CENTER,
                                            backgroundColor: Colors.green);
                                      }
                                    }))
                            : CircularProgressIndicator(),
                      ],
                    )),
              ],
            )),
          ],
        ),
      )),
    );
  }
}
