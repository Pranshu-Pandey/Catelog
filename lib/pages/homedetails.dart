import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/addtocart.dart';
import 'package:catalog/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Items? catalog;
  HomeDetailPage({super.key, required this.catalog}) : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(catalog!.title.toString()),
      ),
      backgroundColor: Mytheme.creamColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreen(image: catalog),
                    ),
                  );
                },
                child: Hero(
                  tag: Key(catalog!.id.toString()),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.2,
                    backgroundImage: NetworkImage(catalog!.image),
                  ),
                ).p16(),
              ),
              Expanded(
                child: VxArc(
                  height: 10,
                  edge: VxEdge.top,
                  child: Container(
                    child: Column(
                      children: [
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "${catalog!.description}",
                            style: TextStyle(),
                            maxLines: 2,
                          ),
                        ),
                        10.heightBox,
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          buttonPadding: Vx.mH24,
                          // buttonPadding: Vx.mOnly(right: 16),
                          children: [
                            "\$${catalog!.price}".text.bold.make(),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     // print("\$${catalog!.price}");
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(
                            //         content: Text("Buying not supported yet"),
                            //       ),
                            //     );
                            //   },
                            //   child: Text(
                            //     "Buy",
                            //     style: TextStyle(color: Colors.white),
                            //   ),
                            //   style: ButtonStyle(
                            //       backgroundColor: MaterialStatePropertyAll(
                            //           Mytheme.darkbuishColor)),
                            // )
                            AddToCart(catalog: catalog)
                          ],
                        )
                      ],
                    ).py32().px12(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FullScreen extends StatelessWidget {
  final image;
  const FullScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 1,
      child: Image.network(image.image),
    );
  }
}
