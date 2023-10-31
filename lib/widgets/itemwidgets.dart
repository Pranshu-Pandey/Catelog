// import 'package:catalog/models/catalog.dart';
// import 'package:flutter/material.dart';

// class ItemWidgets extends StatefulWidget {
//   final Items product;

//   const ItemWidgets({super.key, required this.product});

//   @override
//   State<ItemWidgets> createState() => _ItemWidgetsState();
// }

// class _ItemWidgetsState extends State<ItemWidgets> {
//   @override
//   Widget build(BuildContext context) {
//     // num n = 0;
//     return Card(
//       // elevation: 0.0,
//       child: ListTile(
//         onTap: () {
//           setState(() {
//             // n += widget.product.price + 1.05;
//           });
//           // print("${n}");
//         },
//         leading: Image.network('${widget.product.image}'),
//         title: Text('${widget.product.title}'),
//         subtitle: Text('\$${widget.product.price}'),
//         trailing: Icon(
//           Icons.delete,
//           color: Colors.red,
//         ),
//       ),
//     );
//   }
// }
