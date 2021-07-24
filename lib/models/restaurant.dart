import 'dart:convert';

class Restaurant {
  // ignore: non_constant_identifier_names
  String id_resto;
  // ignore: non_constant_identifier_names
  var nom_resto;
  String? map;
  String? adress;
  String? wilaya;
  String? dure;
  // ignore: non_constant_identifier_names
  var img_cover;
  // ignore: non_constant_identifier_names
  var img_profile;
  String? service;
  // ignore: non_constant_identifier_names
  String? num_tel;
  bool isFavorite;
  Restaurant({
    // ignore: non_constant_identifier_names
    required this.id_resto,
    // ignore: non_constant_identifier_names
    required this.nom_resto,
    required this.map,
    required this.adress,
    required this.wilaya,
    required this.dure,
    // ignore: non_constant_identifier_names
    required this.img_cover,
    // ignore: non_constant_identifier_names
    required this.img_profile,
    required this.service,
    // ignore: non_constant_identifier_names
    required this.num_tel,
    this.isFavorite = false,
  });
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id_resto: json['id_resto'].toString(),
      nom_resto: json['nom_resto'].toString(),
      map: json['map'].toString(),
      adress: json['adress'].toString(),
      wilaya: json['wilaya'].toString(),
      dure: json['dure'].toString(),
      img_cover: json['img_cover'].toString(),
      img_profile: json['img_profile'].toString(),
      service: json['service'].toString(),
      num_tel: json['num_tel'].toString(),
    );
  }
  static Map<String, dynamic> toMap(Restaurant res) {
    return {
      "id_resto": res.id_resto,
      "nom_resto": res.nom_resto,
      "map": res.map,
      "adress": res.adress,
      "wilaya": res.wilaya,
      "dure": res.dure,
      "img_cover": res.img_cover,
      "img_profile": res.img_profile,
      "service": res.service,
      "num_tel": res.num_tel,
    };
  }

  static String encode(List<Restaurant?>? resto) => json
      .encode(
        resto!
            .map(
              (res) => Restaurant.toMap(res!),
            )
            .toList(),
      )
      .toString();

  static List<Restaurant?>? decode(String? res) => (json.decode(res!) as List)
      .map<Restaurant?>((item) => Restaurant.fromJson(item))
      .toList();
}
