import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/details_cubit.dart';
import 'widget/details_header.dart';
import 'widget/scetion_car.dart';
import 'widget/section_additional.dart';
import 'widget/section_code.dart';
import 'widget/section_demonyms.dart';
import 'widget/section_flag_info.dart';
import 'widget/section_basic_info.dart';
import 'widget/section_borders.dart';
import 'widget/section_geographic.dart';
import 'widget/section_languages.dart';
import 'widget/section_mab.dart';
import 'widget/section_postal.dart';
import 'widget/section_statistics.dart';
import 'widget/section_translations.dart';

class CountryDetailsPage extends StatefulWidget {
  final String cca3;
  const CountryDetailsPage({super.key, required this.cca3});

  @override
  State<CountryDetailsPage> createState() => _CountryDetailsPageState();
}

class _CountryDetailsPageState extends State<CountryDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DetailsCubit>().getDetails(widget.cca3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e) => Center(child: Text(e.message)),
            loaded: (detailsModel) {
              if (detailsModel?.first == null) {
                return const Center(child: Text('No data', style: TextStyle(fontSize: 20)));
              }
              final data = detailsModel!.first;
              return CustomScrollView(
                slivers: [
                  DetailsHeader(data: data),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SectionFlagInfo(detailsModel: data),
                          SectionBasicInfo(data: data),
                          const SizedBox(height: 16),
                          SectionStatistics(data: data),
                          const SizedBox(height: 16),
                          SectionLanguages(data: data),
                          const SizedBox(height: 16),
                          SectionBorders(data: data),
                          const SizedBox(height: 16),
                          SectionAdditional(data: data),
                          const SizedBox(height: 16),
                          CountryGeography(data: data),
                          const SizedBox(height: 16),
                          SectionCommunication(data: data),
                          const SizedBox(height: 16),
                          CountryIdentifiers(data: data),
                          const SizedBox(height: 16),
                          SectionPostal(data: data),
                          const SizedBox(height: 16),
                          SectionTranslations(data: data),
                          const SizedBox(height: 16),
                          SectionPeople(data: data),
                          const SizedBox(height: 16),
                          CountryLocation(data: data,),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
