import 'package:countries/features/home/ui/widget/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries/features/home/logic/home_cubit.dart';
import 'package:countries/features/home/data/model/modele.dart';

import 'widget/sliver_app_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          state.mapOrNull(
            error: (e) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(e.failure.message)));
            },
          );
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is Loaded) {
            final List<HomeModel> countries = state.modeles;

            return CustomScrollView(
              slivers: [
                CustomSliverAppBar(onSearchChanged: (value) {}),
                GridViewBuilder(countries: countries),
              ],
            );
          }

          if (state is Error) {
            return Center(
              child: Text(
                state.failure.message,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }

          return const Center(
            child: Text(
              "Press the refresh button to load countries 🌎",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<HomeCubit>().getHomeData(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
