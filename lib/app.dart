import 'app_barrel.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CountriesBloc(CountriesDataSource())
                ..add(LoadCountries()),

      // var bloc = CountryBloc(CountryDataSource());
      // bloc.add(LoadCountries());
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
