// lib/features/home/logic/home_cubit.dart
import 'dart:async';

import 'package:countries/networking/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:countries/networking/failure.dart';

import '../../../coor/use_case/use_cases.dart';
import '../domain/entities/entities.dart';
import '../domain/usecases/get_countries_api.dart';
import '../domain/usecases/get_countries_local.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCountriesRemoteHomeUseCase getcountriesRemoteUseCase;
  final GetCountriesLocalHomeUseCase getCountriesLocalHomeUseCase;

  List<Country> _allCountries = [];
  String _query = '';
  String? _currentFilter;

  HomeCubit({required this.getcountriesRemoteUseCase, required this.getCountriesLocalHomeUseCase})
    : super(const HomeState.initial());

  Future<void> getHomeData() async {
    final cachedData = await getCountriesLocalHomeUseCase.call();

    if (cachedData != null && cachedData.isNotEmpty) {
      emit(const HomeState.loading());
      await Future.delayed(const Duration(seconds: 1));
      _allCountries = cachedData;
      emit(HomeState.loaded(cachedData, source: DataSource.local));
      unawaited(
        getcountriesRemoteUseCase.call(const NoParams()).then((value) {
          value.when(
            success: (freshData, source) {
              _allCountries = freshData;
              emit(HomeState.loaded(freshData, source: source));
            },
            error: (_) {},
          );
        }),
      );
    } else {
      emit(const HomeState.loading());
      final result = await getcountriesRemoteUseCase.call(const NoParams());
      result.when(
        success: (data, source) {
          _allCountries = data;
          emit(HomeState.loaded(data, source: source));
        },
        error: (error) => emit(HomeState.error(error)),
      );
    }
  }

  void setFilter(String? filter) {
    _currentFilter = filter;
    _applyFilter();
  }

  void search(String query) {
    _query = query.trim().toLowerCase();
    _applyFilter();
  }

  void _applyFilter() {
    final q = _query;

    if (q.isEmpty) {
      final currentSource = state.maybeMap(
        loaded: (loaded) => loaded.source,
        orElse: () => DataSource.remote,
      );
      emit(HomeState.loaded(_allCountries, source: currentSource));
      return;
    }

    final filtered = _allCountries.where((country) {
      final query = q.toLowerCase();

      bool swc(String? s) => s?.toLowerCase().startsWith(query) ?? false;

      switch (_currentFilter) {
        case 'Code':
          final codeString = country.callingCodes.join('');

          return swc(codeString) || swc(country.cca2) || swc(country.cca3);

        case 'Capital':
          return swc(country.capital);

        case 'Language':
          return country.languages.any((langMap) {
            return langMap.values.any((v) => swc(v));
          });

        default: // Name
          return swc(country.name);
      }
    }).toList();

    final currentSource = state.maybeMap(
      loaded: (loaded) => loaded.source,
      orElse: () => DataSource.remote,
    );
    emit(HomeState.loaded(filtered, source: currentSource));
  }
}
