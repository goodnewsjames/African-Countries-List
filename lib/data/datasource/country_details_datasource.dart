import 'package:african_countries/app_barrel.dart';

class CountryDetailsDatasource {
  Future<CountryDetails> getCountryDetails(
    String countryName,
  ) async {
    try {
      final String url =
          "https://restcountries.com/v3.1/name/${countryName}";
      final response = await get(Uri.parse(url));

      print("raw response");
      print(response);
      print(response.statusCode);

      final jsonData = jsonDecode(response.body);

      print("raw json data");

      final countries = jsonData;

      final country = countries[0];
      print(country);

      return CountryDetails(
        name: country["name"]["common"],
        officialName: country["name"]["official"],
        capital:
            country['capital'] != null
                ? country['capital'][0]
                : 'No Capital',
        region: country["region"] = "Unknown",
        subregion: country["subregion"] ?? "Unknown",
        languages:
            (country["languages"] as Map<dynamic, dynamic>)
                .values
                .toList()[0],
        area: country["area"],
        population: country["population"],
        flagUrl: country["flags"]["svg"],
        coatOfArmsUrl: country["coatOfArms"]?["png"],
        currency:
            (country["currencies"] as Map<dynamic, dynamic>)
                .values
                .toList()[0]["name"],
      );
    } catch (e) {
      throw Exception("Error fetching details: $e");
    }
  }
}
