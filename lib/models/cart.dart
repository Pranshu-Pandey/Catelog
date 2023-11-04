import 'package:catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  Catelog? _catalog;
  final List<num> _itemId = [];
  Catelog get catalog => _catalog!;
  set catalog(Catelog newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Items> get items => _itemId.map((id) => _catalog!.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  // Add items
  void add(Items item) {
    _itemId.add(item.id);
  }

  // Remove items
  void remove(Items item) {
    _itemId.remove(item.id);
  }
}
