import 'package:dennic_project/utils/constants/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_country_event.dart';

part 'search_country_state.dart';

class SearchCountryBloc extends Bloc<SearchCountryEvent, SearchCountryState> {
  SearchCountryBloc()
      : super(
          const SearchCountryState(
            countries: AppConstants.countries,
            searchedCountry: [],
          ),
        ) {
    on<AddSearchCountryEvent>(_addSearch);
  }

  _addSearch(AddSearchCountryEvent event, emit) {
    List<String> searchedC = [];

    for (String element in state.countries) {
      if (element.toLowerCase().startsWith(event.query.toLowerCase())) {
        searchedC.add(element);
      }
    }

    emit(
      state.copyWith(
        searchedCountry: searchedC,
      ),
    );
  }

}
