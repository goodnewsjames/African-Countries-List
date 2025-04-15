import 'package:african_countries/app_barrel.dart';
part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc
    extends Bloc<CountriesEvent, CountriesState> {
  final CountriesDataSource dataSource;

  final detailSource = CountryDetailsDatasource();

  CountriesBloc(this.dataSource)
    : super(CountriesInitial()) {
    on<LoadCountries>((event, emit) async {
      emit(CountriesLoading());

      try {
        List<Country> countries =
            await dataSource.getAllCountries();
        countries.sort((a, b) => a.name.compareTo(b.name));

        print("gotten countries");

        emit(CountriesLoaded(countries: countries));
      } catch (e) {
        print("api error");

        emit(Error());
      }
    });

    on<ClickCountry>((event, emit) async {
      try {
        print(
          "country name: ${event.countryName.toLowerCase()}",
        );

        CountryDetails details = await detailSource
            .getCountryDetails(
              event.countryName.toLowerCase(),
            );

        print('Details fetched: ${details.name}');

        emit(CountryDetailsLoaded(details: details));
      } catch (e) {
        print('ClickCountry error: $e');
        emit(Error());
      }
    });
  }
}
