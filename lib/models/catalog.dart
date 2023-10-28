class Items {
  final num id;
  final String title;
  final num price;
  final String description;
  final String catagory;
  final num rating;
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

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map["id"],
      title: map["title"],
      price: map["price"],
      description: map["description"],
      catagory: map["catagory"],
      rating: map["rating"],
      image: map["image"],
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
  static List<Items> products = [];
  // [
  //   Items(
  //       catagory: "men's clothing",
  //       description:
  //           "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
  //       id: 1.0,
  //       price: 109.95,
  //       rating: 3.9,
  //       title: "Fjallraven - Foldsack No. 1 Backpack",
  //       image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
  //   Items(
  //     catagory: "men's clothing",
  //     description:
  //         "A versatile backpack for all your adventures. This pack includes a padded laptop sleeve for laptops up to 15 inches, making it ideal for work or outdoor trips.",
  //     price: 129.99,
  //     rating: 4.2,
  //     image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
  //     id: 2,
  //     title: 'Good iyems',
  //   ),
  // ];
}
