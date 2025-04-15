import 'package:african_countries/app_barrel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('African Countries')),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 1,
              ),
            );
          }

          if (state is CountriesLoaded) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: state.countries.length,
                itemBuilder: (context, index) {
                  return CountryTile(
                    state.countries[index],
                    index: index,
                    onPressed: () {
                      context.read<CountriesBloc>().add(
                        ClickCountry(
                          countryName:
                              state.countries[index].name,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  CountryDetailsScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }
          return Center(
            child: Text('Something went wrong'),
          );
        },
      ),
    );
  }
}
