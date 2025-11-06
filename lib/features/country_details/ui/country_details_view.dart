import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/details_cubit.dart';
import 'widget/app_bar.dart';

class CountryDetails extends StatefulWidget {
  final String cca3;
  const CountryDetails({super.key, required this.cca3});

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
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
      body: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {
          print("======================================");
          print('Cubit emitted ${state.runtimeType}');
          state.mapOrNull(
            error: (e) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(e.failure.message)));
            },
          );
        },
        builder: (context, state) {
          state.mapOrNull(
            loaded: (value) {
              final data = value.detailsModel;
              return CustomScrollView(slivers: [CustomSliverAppBar(data: data!)]);
            },
            loading: (value) {
              return const Center(child: CircularProgressIndicator());
            },
          );

          return SizedBox.shrink();
        },
      ),
    );
  }
}
