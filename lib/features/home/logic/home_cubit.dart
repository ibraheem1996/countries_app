// lib/features/home/logic/home_cubit.dart
import 'package:countries/networking/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:countries/networking/failure.dart';

import '../../../coor/use_case/use_cases.dart';
import '../domain/entities.dart';
import '../domain/use_cases.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCountriesUseCase countriesUseCase;

  List<Country> _allCountries = [];
  String _query = '';
  String? _currentFilter;

  HomeCubit({required this.countriesUseCase}) : super(const HomeState.initial());

  Future<void> getHomeData() async {
    final cachedData = await countriesUseCase.getCachedCountries();

    if (cachedData != null && cachedData.isNotEmpty) {
      emit(const HomeState.loading());
      await Future.delayed(const Duration(seconds: 1));
      _allCountries = cachedData;
      emit(HomeState.loaded(cachedData));
      countriesUseCase.call(const NoParams()).then((value) {
        value.when(
          success: (freshData) {
            _allCountries = freshData;
            emit(HomeState.loaded(freshData));
          },
          error: (_) {},
        );
      });
    } else {
      emit(const HomeState.loading());
      final result = await countriesUseCase.call(const NoParams());
      result.when(
        success: (data) {
          _allCountries = data;
          emit(HomeState.loaded(data));
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
      emit(HomeState.loaded(_allCountries));
      return;
    }

    bool startsWith(String? text) => (text ?? '').toLowerCase().startsWith(q);

    final filtered = _allCountries.where((country) {
      switch (_currentFilter) {
        case 'Code':
          final root = country.phoneRoot ?? '';
          final suffix = (country.phoneSuffixes).join('');
          final phone = '$root$suffix';

          final cleanPhone = phone.replaceAll('+', '');
          final cleanQuery = q.replaceAll('+', '');

          bool swc(String s) => s.toLowerCase().startsWith(cleanQuery);

          return swc(phone) ||
              swc(cleanPhone) ||
              swc(root) ||
              startsWith(country.cca2) ||
              startsWith(country.cca3);

        case 'Capital':
          return country.capital.any(startsWith);

        case 'Language':
          return country.languages.any(startsWith);

        default: // Name
          return startsWith(country.nameCommon) || startsWith(country.nameOfficial);
      }
    }).toList();

    emit(HomeState.loaded(filtered));
  }
}
