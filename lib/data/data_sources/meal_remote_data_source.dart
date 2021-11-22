part of 'data_sources.dart';

abstract class MealRemoteDataSource {
  Future<List<MealModel>> getMeals();
}

class MealRemoteDataSourceImpls extends MealRemoteDataSource {
  final ApiClient apiClient;

  MealRemoteDataSourceImpls(this.apiClient);

  @override
  Future<List<MealModel>> getMeals() async {
    final response = await apiClient.get('search.php?f=a');
    final respValue = response['meals'];

    List<MealModel> values =
        (respValue as Iterable).map((e) => MealModel.fromJson(e)).toList();

    return values;
  }
}
