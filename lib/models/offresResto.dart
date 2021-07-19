class OffresResto {
  // ignore: non_constant_identifier_names
  var imgUrl;

  OffresResto({
    // ignore: non_constant_identifier_names
    required this.imgUrl,
  });
  factory OffresResto.fromJson(Map<String, dynamic> json) {
    return OffresResto(
      imgUrl: json['imgUrl'].toString(),
    );
  }
}
