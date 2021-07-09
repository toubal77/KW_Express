class DetailRestaurant {
  // ignore: non_constant_identifier_names
  String nom_spec;
  // ignore: non_constant_identifier_names
  String id_spec;
  DetailRestaurant({
    // ignore: non_constant_identifier_names
    required this.id_spec,
    // ignore: non_constant_identifier_names
    required this.nom_spec,
  });
  factory DetailRestaurant.fromJson(Map<String, dynamic> json) {
    return DetailRestaurant(
      id_spec: json['id_speciality'].toString(),
      nom_spec: json['nom_speciality'].toString(),
    );
  }
}
