class Restaurant {
  // ignore: non_constant_identifier_names
  String? id_resto;
  // ignore: non_constant_identifier_names
  String? nom_resto;
  String? map;
  String? adress;
  String? wilaya;
  String? dure;
  // ignore: non_constant_identifier_names
  var img_cover;
  // ignore: non_constant_identifier_names
  String? img_profile;
  String? service;
  // ignore: non_constant_identifier_names
  String? num_tel;
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
  });
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id_resto: json['id_resto'],
      nom_resto: json['nom_resto'],
      map: json['map'],
      adress: json['adress'],
      wilaya: json['wilaya'],
      dure: json['dure'],
      img_cover: json['img_cover'],
      img_profile: json['img_profile'],
      service: json['service'],
      num_tel: json['num_tel'],
    );
  }
}
