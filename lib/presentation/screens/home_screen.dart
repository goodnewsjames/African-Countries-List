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

          if (state is Error) {
            return Center(
              child: Text('Something went wrong'),
            );
          }
          return context.read<CountriesBloc>().allCountries.isNotEmpty
          ? Container(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: context.read<CountriesBloc>().allCountries.length,
              itemBuilder: (context, index) {
                return CountryTile(
                  context.read<CountriesBloc>().allCountries[index],
                  index: index,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                            CountryDetailsScreen(name: context.read<CountriesBloc>().allCountries[index].name,),
                      ),
                    );
                  },
                );
              },
            ),
          )
              : Center(
            child: Text('No countries found'),
          );

        },
      ),
    );
  }
}
