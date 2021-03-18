import 'package:flutter/material.dart';
import 'package:mac_services/config/colors.dart';
import 'package:mac_services/views/pageViews/search.dart';
import 'package:mac_services/widgets/icon_cart.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  

  @override
  Widget build(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      Text("Bienvenue sur", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "roboto"),),
                      Text("Mac services", style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "roboto"),)
                    ],
                  ),
                  myAppBarIcon(data: 10), 
                ],
              ),SizedBox(height: 30.0),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Search())),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  color: ColorsSys.grey,
                  borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey,),
                        SizedBox(width: 20.0,),
                        Text("Rechercher ...", style: TextStyle(color: Colors.grey,fontSize: 15.0))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),

                
            ],
          ),
        ),
      ),
    );
  }
}

