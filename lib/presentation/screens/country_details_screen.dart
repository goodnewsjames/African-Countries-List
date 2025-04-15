import 'package:african_countries/app_barrel.dart';

class CountryDetailsScreen extends StatelessWidget {
  const CountryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            BlocProvider.of<CountriesBloc>(
              context,
            ).add(LoadCountries());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<CountriesBloc, CountriesState>(
          builder: (context, state) {
            if (state is CountriesLoading) {
              return CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.black,
              );
            }

            if (state is CountryDetailsLoaded) {
              final details = state.details;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.network(
                      details.flagUrl,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Icon(Icons.error),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            elevation: 2,
                            child: SizedBox(
                              height: 150,
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(
                                      16.0,
                                    ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                      children: [
                                        HeaderText(
                                          details.name,
                                        ),
                                        SizedBox(height: 8),
                                        Subtext(
                                          details
                                              .officialName,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        HeaderText(
                                          'Capital,',
                                        ),
                                        SizedBox(height: 8),
                                        Subtext(
                                          details.capital,
                                        ),
                                      ],
                                    ),
                                    Image.network(
                                      details
                                          .coatOfArmsUrl!,
                                      height: 100,
                                      width: 100,
                                      errorBuilder:
                                          (
                                            context,
                                            error,
                                            stackTrace,
                                          ) => Icon(
                                            Icons.circle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                HeaderText('Population'),
                                SizedBox(height: 8),
                                Subtext(
                                  "${details.population}",
                                ),
                                SizedBox(height: 16),
                                HeaderText('Language'),
                                SizedBox(height: 8),
                                Subtext(details.languages),
                                SizedBox(height: 16),
                                HeaderText('Region'),
                                SizedBox(height: 8),
                                Subtext(details.region),
                                SizedBox(height: 16),
                                HeaderText('Sub Region'),
                                SizedBox(height: 8),
                                Subtext(details.subregion),
                                SizedBox(height: 16),
                                HeaderText('Land Area'),
                                SizedBox(height: 8),
                                Subtext("${details.area}"),
                                SizedBox(height: 16),
                                HeaderText('Currency'),
                                SizedBox(height: 8),
                                Subtext(details.currency),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
