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
  dynamic productsdata;
  Catalog? catalog;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var json = await rootBundle.loadString("assets/files/catelog.json");
    var decodedjson = jsonDecode(json);
    await Future.delayed(Duration(seconds: 2));
    productsdata = decodedjson["products"];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
        centerTitle: true,
        // backgroundColor: Colors.lightBlue,
      ),
      drawer: MyDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: productsdata == null
              ? const Text("Loading")
              : productsdata.length == 0
                  ? const Text("No catalog found")
                  : ListView.builder(
                      itemCount: productsdata.length,
                      itemBuilder: (context, index) {
                        Items item = Items.fromJson(productsdata[index]);
                        return ItemWidgets(
                          product: item,
                        );
                      },
                    )),
    );
  }
}
