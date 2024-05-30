part of 'search_country_bloc.dart';

sealed class SearchCountryEvent extends Equatable {
  const SearchCountryEvent();
}

class AddSearchCountryEvent extends SearchCountryEvent {
  final String query;

  const AddSearchCountryEvent({
    required this.query,
  });

  @override
  List<Object?> get props => [
        query,
      ];
}
