import 'package:african_countries/app_barrel.dart';

class CountriesDataSource {
  final String url =
      'https://restcountries.com/v3.1/region/africa?status=true&fields=name,languages,capital,flags';
  Future<List<Country>> getAllCountries() async {
    final response = await get(Uri.parse(url));
    final List jsonData = json.decode(response.body);
    List<Country> countries = [];
    for (var item in jsonData) {
      countries.add(
        Country(
          flag: item['flags']['png'],
          name: item['name']['common'],
          officialName: item['name']['official'],
          capital:
              item['capital'] != null
                  ? item['capital'][0]
                  : 'No Capital',
        ),
      );
    }
    return countries;
  }
}


// {"flags":{"png":"https://flagcdn.com/w320/ls.png","svg":"https://flagcdn.com/ls.svg","alt":"The flag of Lesotho is composed of three horizontal bands of blue, white and green in the ratio of 3:4:3. A black mokorotlo — a Basotho hat — is centered in the white band."},"name":{"common":"Lesotho","official":"Kingdom of Lesotho","nativeName":{"eng":{"official":"Kingdom of Lesotho","common":"Lesotho"},"sot":{"official":"Kingdom of Lesotho","common":"Lesotho"}}},"capital":["Maseru"],"languages":{"eng":"English","sot":"Sotho"}},