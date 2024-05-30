part of 'search_country_bloc.dart';

class SearchCountryState extends Equatable {
  final List<String> countries;
  final List<String> searchedCountry;

  const SearchCountryState({
    required this.countries,
    required this.searchedCountry,
  });

  SearchCountryState copyWith({List<String>? searchedCountry}) =>
      SearchCountryState(
        countries: AppConstants.countries,
        searchedCountry: searchedCountry ?? this.searchedCountry,
      );

  @override
  List<Object?> get props => [
        searchedCountry,
        countries,
      ];
}
