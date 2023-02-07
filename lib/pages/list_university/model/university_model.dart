class UniversityModel {
  String alphaTwoCode;
  List<String> domains;
  String country;
  String stateProvince;
  List<String> webPages;
  String name;

  UniversityModel({
    required this.alphaTwoCode,
    required this.domains,
    required this.country,
    required this.stateProvince,
    required this.webPages,
    required this.name,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      alphaTwoCode: json['alpha_two_code'],
      domains: List<String>.from(json['domains']),
      country: json['country'],
      stateProvince: json['state-province'] ?? '',
      webPages: List<String>.from(json['web_pages']),
      name: json['name'],
    );
  }
}
