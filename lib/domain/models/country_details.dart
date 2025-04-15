class CountryDetails {
  final String name;
  final String officialName;
  final String flagUrl;
  final String? coatOfArmsUrl; 
  final String capital;
  final int population;
  final double area;
  final String currency; 
  final String languages; 
  final String region;
  final String subregion;

  CountryDetails({
    required this.name,
    required this.officialName,
    required this.flagUrl,
    this.coatOfArmsUrl,
    required this.capital,
    required this.population,
    required this.area,
    required this.currency,
    required this.languages,
    required this.region,
    required this.subregion,
  });
}
