// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  static List<Item> items = [
    Item(id: 1, name: "", desc: "", price: 0, color: "", image: "")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap() {
    return {
      "id": id,
      "name": name,
      "desc": desc,
      "price": price,
      "color": color,
      "image": image
    };
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'desc': desc,
  //     'price': price,
  //     'color': color,
  //     'image': image,
  //   };
  // }

  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //     map['id'] as int,
  //     map['name'] as String,
  //     map['desc'] as String,
  //     map['price'] as num,
  //     map['color'] as String,
  //     map['image'] as String,
  //   );
  // }

}
