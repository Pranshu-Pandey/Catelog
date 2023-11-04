class Items {
  final num id;
  final String title;
  final num price;
  final String description;
  final String catagory;
  final dynamic rating;
  final String image;

  Items({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.catagory,
    required this.rating,
    required this.image,
  });

  // factory Items.fromMap(Map<String, dynamic> map) {
  //   return Items(
  //     id: map["id"],
  //     title: map["title"],
  //     price: map["price"],
  //     description: map["description"],
  //     catagory: map["catagory"],
  //     rating: map["rating"],
  //     image: map["image"],
  //   );
  // }

  factory Items.fromMap(Map<String, dynamic> map) {
    final ratingMap = map['rating'] as Map<String, dynamic>;
    final double rate = ratingMap['rate'] as double;

    return Items(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      catagory: map['category'] as String,
      image: map['image'] as String,
      rating: rate,
    );
  }

  toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "rating": rating,
        "image": image,
        "catagory": catagory,
      };
}

class Catelog {
  static final catModel = Catelog._internal();

  Catelog._internal();

  factory Catelog() => catModel;

  static List<dynamic> products = [];

  // item get by id
  Items getById(num id) =>
      products.firstWhere((element) => element.id == id, orElse: null);

  // item by position
  Items getByPosition(num pos) => products[pos.toInt()];
}
