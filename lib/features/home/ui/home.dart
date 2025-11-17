import 'package:countries/features/home/ui/widget/gridview/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries/features/home/logic/home_cubit.dart';
import 'widget/animated_retry_button.dart';
import 'widget/page_retry.dart';
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.failure.message ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.redAccent.shade200,
                  duration: const Duration(seconds: 3),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error) => RetryWidget(message: error.message, icon: error.icon!),
            loaded: (countries) => CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CustomSliverAppBar(
                  onSearchChanged: (value) => context.read<HomeCubit>().search(value!),
                  onFilterChanged: (filter) => context.read<HomeCubit>().setFilter(filter),
                ),
                GridViewBuilder(countries: countries),
              ],
            ),
          );
        },
      ),
      floatingActionButton: const AnimatedRetryButton(),
    );
  }
}
