import 'package:countries/features/home/data/model/modele.dart';
import 'package:countries/features/home/data/repos/home_repos.dart';
import 'package:countries/networking/api_result.dart';
import 'package:countries/networking/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepos homeRepos;
  HomeCubit( { required this.homeRepos}) : super(HomeState.initial());

  Future<void> getHomeData() async {
    emit(HomeState.loading());
    final result = await homeRepos.getHomeData();
    result.when(
      success: (data) => emit(HomeState.loaded(data)),
      error: (error) => emit(HomeState.error(error)),
    );
  }
}
