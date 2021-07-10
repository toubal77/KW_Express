class DetailRestoMenu {
  String nom;
  String info;
  String prix;
  DetailRestoMenu({
    required this.nom,
    required this.info,
    required this.prix,
  });
  factory DetailRestoMenu.fromJson(Map<String, dynamic> json) {
    print('fromJson detailRestaurant Menu');
    print(json['nom'].toString());
    print(json['info'].toString());
    print(json['prix'].toString());
    return DetailRestoMenu(
      nom: json['nom'].toString(),
      info: json['info'].toString(),
      prix: json['prix'].toString(),
    );
  }
}
