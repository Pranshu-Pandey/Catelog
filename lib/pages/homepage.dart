import 'dart:convert';

import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

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
    Catelog.products = productsdata.map((item) => Items.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mytheme.creamColor,
      drawer: MyDrawer(),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatelogHeader(),
              if (Catelog.products != null && Catelog.products.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.color(Mytheme.darkbuishColor).bold.make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catelog.products.length,
      itemBuilder: (context, index) {
        final catalog = Catelog.products[index];
        return CatalogItem(
          catalog: catalog,
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Items? catalog;
  CatalogItem({@required this.catalog}) : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(catalog: catalog)
            .box
            .rounded
            .p8
            .color(Mytheme.creamColor)
            .make()
            .p16()
            .w40(context),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //need to add maxlines to overcome lineoverflow
            // catalog!.title.text.bold.color(Mytheme.darkbuishColor).make(),
            Text(
              "${catalog!.title}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Mytheme.darkbuishColor,
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 15,
            ),
            //need to add maxlines to overcome lineoverflow
            // catalog!.description.text.textStyle(context.captionStyle).make(),
            Text(
              "${catalog!.description}",
              style: TextStyle(),
              maxLines: 2,
            ),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH16,
              // buttonPadding: Vx.mOnly(right: 16),
              children: [
                "\$${catalog!.price}".text.bold.make(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Buy",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Mytheme.darkbuishColor)),
                )
              ],
            )
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    super.key,
    required this.catalog,
  });

  final Items? catalog;

  @override
  Widget build(BuildContext context) {
    return Image.network('${catalog?.image}');
  }
}
