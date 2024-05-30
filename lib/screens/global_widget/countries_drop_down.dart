import 'package:dennic_project/blocs/search_country/search_country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountriesDropDown extends StatelessWidget {
  final List<String> items;
  final TextEditingController textEditingController;

  const CountriesDropDown({
    super.key,
    required this.items,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 20.h,
        ),
        BlocBuilder<SearchCountryBloc, SearchCountryState>(
            builder: (context, state) {
          return Expanded(
            child: ListView.builder(
              itemCount: textEditingController.text.isEmpty
                  ? state.countries.length
                  : state.searchedCountry.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    textEditingController.text.isEmpty
                        ? state.countries[index]
                        : state.searchedCountry[index],
                  ),
                  onTap: () {
                    Navigator.pop(
                      context,
                      items[index],
                    );
                  },
                );
              },
            ),
          );
        }),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: SizedBox(
            height: 50.h,
            child: TextField(
              controller: textEditingController,
              onChanged: (v) {
                context.read<SearchCountryBloc>().add(
                  AddSearchCountryEvent(
                    query: v,
                  ),
                );
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                // icon: Icon(Icons.search)
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
