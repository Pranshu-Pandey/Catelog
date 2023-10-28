import 'dart:convert';

import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/itemwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var json = await rootBundle.loadString("assets/files/catelog.json");
    var decodedjson = jsonDecode(json);
    final productsdata = decodedjson["products"];
    print(productsdata);
    // print(Catelog.products);
    // Catelog.products = productsdata.map((item) => Items.fromMap(item)).toList();
    Catelog.products = [
      Items(
        id: 2,
        catagory: "men's clothing",
        description:
            "A versatile backpack for all your adventures. This pack includes a padded laptop sleeve for laptops up to 15 inches, making it ideal for work or outdoor trips.",
        price: 129.99,
        rating: 4.2,
        // image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        image:
            "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
        title: 'Good items',
      ),
    ];
    //     List.from(productsdata).map<Items>((e) => Items.fromMap(e)).toList();
    setState(() {});
  }

  // loadData() async {
  //   try {
  //     var json = await rootBundle.loadString("assets/files/catelog.json");
  //     var decodedjson = jsonDecode(json);
  //     final productsdata = decodedjson["products"];
  //     Catelog.products =
  //         productsdata.map((item) => Items.fromMap(item)).toList();

  //     // Add your hardcoded items to the list
  //     Catelog.products.addAll([
  //       Items(
  //         catagory: "men's clothing",
  //         description:
  //             "A versatile backpack for all your adventures. This pack includes a padded laptop sleeve for laptops up to 15 inches, making it ideal for work or outdoor trips.",
  //         price: 129.99,
  //         rating: 4.2,
  //         image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
  //         id: 2,
  //         title: 'Good items',
  //       ),
  //     ]);

  //     setState(() {});
  //   } catch (error) {
  //     // Handle any errors that may occur while loading or parsing the JSON data.
  //     print("Error loading JSON data: $error");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        centerTitle: true,
        // backgroundColor: Colors.lightBlue,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: Catelog.products.length,
          itemBuilder: (context, index) {
            return ItemWidgets(
              product: Catelog.products[index],
            );
          },
        ),
      ),
    );
  }
}
