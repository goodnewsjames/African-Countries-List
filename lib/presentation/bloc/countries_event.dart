part of 'countries_bloc.dart';

sealed class CountriesEvent {}

class LoadCountries extends CountriesEvent {}

class ClickCountry extends CountriesEvent {
  final String countryName;
  ClickCountry({required this.countryName});
}