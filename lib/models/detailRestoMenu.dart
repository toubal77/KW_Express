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
    return DetailRestoMenu(
      nom: json['nom'].toString(),
      info: json['info'].toString(),
      prix: json['prix'].toString(),
    );
  }
}
