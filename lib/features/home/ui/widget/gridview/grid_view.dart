import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../coor/dependency/dependency_get_it.dart';
import '../../../../country_details/logic/details_cubit.dart';
import '../../../../country_details/ui/country_details_view.dart';
import '../../../domain/entities.dart';
import 'animated_card.dart';
import 'build_country_card.dart';
import 'build_flag.dart';
import 'build_name_code.dart';

class GridViewBuilder extends StatelessWidget {
  final List<Country> countries;
  const GridViewBuilder({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    bool isOrientation = MediaQuery.of(context).orientation == Orientation.portrait;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: isOrientation ? 0.90 : 1.5,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final country = countries[index];
        final imageUrl = country.flagPng ?? country.flagSvg;

        return AnimatedCard(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => getIt<DetailsCubit>(),
                  child: CountryDetailsPage(cca3: country.cca3),
                ),
              ),
            );
          },
          child: BuildCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 6, child: buildFlag(imageUrl)),
                Expanded(flex: 2, child: buildNameAndCode(country, context)),
              ],
            ),
          ),
        );
      }, childCount: countries.length),
    );
  }
}
