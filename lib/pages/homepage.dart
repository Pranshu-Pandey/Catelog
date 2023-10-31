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
  // List<String> titles = [];
  // List<String> images = [];
  // List<num> prices = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var json = await rootBundle.loadString("assets/files/catelog.json");
    var decodedjson = jsonDecode(json);
    final productsdata = decodedjson["products"];
    // print(productsdata);
//     for (dynamic i in productsdata) {
//       // Catelog.products = i;
//       String title = i["title"];
//       titles.add(title);
//       String image = i["image"];
//       images.add(image);
//       num price = i["price"];
//       prices.add(price);
//       // Create an 'Items' object from the JSON data
//       Items item = Items.fromMap(i);
//       print(item.catagory);

// // Add the 'Items' object to your list of products
//       Catelog.products.add(item);
//       // print(i);
//     }
    // print(Catelog.products);
    Catelog.products = productsdata.map((item) => Items.fromMap(item)).toList();
    // print(Catelog.products);
    //[Items(id: ,image,title),Items(id,image,title),Items(id,image,title),Items(id,image,title)]
    // Catelog.products = [
    //   Items(
    //     id: 2,
    //     catagory: "",
    //     description: "",
    //     price: 0,
    //     rating: {
    //       "rating": {"rate": 3.9, "count": 120}
    //     },
    //     // image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    //     image: "",
    //     title: 'Velocity',
    //   ),
    // ];
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
      backgroundColor: Mytheme.creamColor,
      // appBar: AppBar(
      //   title: Text("Catalog App"),
      //   centerTitle: true,
      //   // backgroundColor: Colors.lightBlue,
      // ),
      drawer: MyDrawer(),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: ListView.builder(
      //     itemCount: Catelog.products.length,
      //     itemBuilder: (context, index) {
      //       return ItemWidgets(
      //         product: Catelog.products[index],
      //       );
      //     },
      //   ),
      // ),
      // body: ListView.builder(
      //   itemCount: Catelog.products.length,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       child: (Catelog.products != null && Catelog.products.isNotEmpty)
      //           ? ListTile(
      //               leading: CircleAvatar(
      //                 backgroundImage:
      //                     NetworkImage(Catelog.products[index].image),
      //               ),
      //               title: Text(
      //                 Catelog.products[index].title,
      //                 maxLines: 1,
      //               ),
      //               subtitle: Text(
      //                 '${Catelog.products[index].description}',
      //                 maxLines: 1,
      //               ),
      //               trailing: Text(
      //                 '\$${Catelog.products[index].price}',
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //             )
      //           : Center(
      //               child: CircularProgressIndicator(),
      //             ),
      //     );
      //   },
      // ),
      //   body: GridView.builder(
      //       itemCount: Catelog.products.length,
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 10),
      //       itemBuilder: (context, index) {
      //         final cat = Catelog.products[index];
      //         return Card(
      //           clipBehavior: Clip.antiAlias,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10)),
      //           child: GridTile(
      //             header: Container(
      //                 padding: EdgeInsets.all(12),
      //                 decoration: BoxDecoration(
      //                   color: Colors.lightBlue,
      //                 ),
      //                 child: Text(
      //                   '${cat.title}',
      //                   style: TextStyle(color: Colors.white),
      //                 )),
      //             child: Image.network('${cat.image}'),
      //             footer: Text('${cat.price}'),
      //           ),
      //         );
      //       }),
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
