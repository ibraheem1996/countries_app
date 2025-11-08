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

  List<HomeModel> _allCountries = [];
  String _query = '';
  String? _currentFilter;

  HomeCubit({required this.homeRepos}) : super(const HomeState.initial());

  Future<void> getHomeData() async {
    emit(const HomeState.loading());
    final result = await homeRepos.getHomeData();

    result.when(
      success: (data) {
        _allCountries = data;
        emit(HomeState.loaded(data));
      },
      error: (error) => emit(HomeState.error(error)),
    );
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
          final iddRoot = country.idd?.root ?? '';
          final iddSuffix = country.idd?.suffixes?.join('') ?? '';
          final phoneCode = '$iddRoot$iddSuffix';
          final cleanPhone = phoneCode.replaceAll('+', '');
          final cleanQuery = q.replaceAll('+', '');

          bool startsWithClean(String text) => text.toLowerCase().startsWith(cleanQuery);

          return startsWithClean(phoneCode) ||
              startsWithClean(cleanPhone) ||
              startsWithClean(iddRoot) ||
              startsWithClean(country.cca2 ?? '') ||
              startsWithClean(country.cca3 ?? '');

        case 'Capital':
          return (country.capital ?? []).any(startsWith);

        case 'Language':
          return (country.languages ?? {}).values.any(startsWith);

        default:
          final name = country.name;
          return startsWith(name?.common) || startsWith(name?.official);
      }
    }).toList();

    emit(HomeState.loaded(filtered));
  }
}
