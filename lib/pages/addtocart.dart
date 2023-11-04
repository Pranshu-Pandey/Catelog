import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    super.key,
    required this.catalog,
  });

  final Items? catalog;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        // print("\$${widget.catalog!.price}");
        if (!isInCart) {
          isInCart = isInCart.toggle();

          final _catalog = Catelog();
          _cart.catalog = _catalog!;
          _cart.add(widget.catalog!);
          setState(() {});
        }
      },
      child: isInCart
          ? Icon(
              Icons.done,
              color: Colors.white,
            )
          : Text(
              "Add to cart",
              style: TextStyle(color: Colors.white),
            ),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Mytheme.darkbuishColor)),
    );
  }
}
