part of 'countries_bloc.dart';

sealed class CountriesState {}

final class CountriesInitial extends CountriesState {}

final class CountriesLoading extends CountriesState {}

final class CountriesLoaded extends CountriesState {
  final List<Country> countries;
  final String? errorMessage;

  CountriesLoaded({
    required this.countries,
    this.errorMessage,
  });
}

final class CountryDetailsLoaded extends CountriesState {
  final CountryDetails details;

  final String? errorMessage;

  CountryDetailsLoaded({
    required this.details,
    this.errorMessage,
  });
}

final class Error extends CountriesState {}
