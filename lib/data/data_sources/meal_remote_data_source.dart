part of 'data_sources.dart';

abstract class MealRemoteDataSource {
  Future<List<MealModel>> getMeals();
  Future<MealDetailModel> getMeal(String id);
  Future<List<MealModel>> getBeefMeals();
  Future<List<MealModel>> getSeafoodMeals();
}

class MealRemoteDataSourceImpls extends MealRemoteDataSource {
  final ApiClient apiClient;

  MealRemoteDataSourceImpls(this.apiClient);

  @override
  Future<List<MealModel>> getMeals() async {
    final response = await apiClient.get('search.php?f=e');
    final respValue = response['meals'];

    List<MealModel> values = (respValue as Iterable)
        .map((e) => MealModel.fromJson(e))
        .take(5)
        .toList();

    return values;
  }

  @override
  Future<MealDetailModel> getMeal(String id) async {
    final response = await apiClient.get('lookup.php?i=' + id);
    final respValue = response['meals'];

    List<MealDetailModel> values = (respValue as Iterable)
        .map((e) => MealDetailModel.fromJson(e))
        .toList();

    return values.first;
  }

  @override
  Future<List<MealModel>> getBeefMeals() async {
    final response = await apiClient.get('filter.php?c=Beef');
    final respValue = response['meals'];

    List<MealModel> values = (respValue as Iterable)
        .map((e) => MealModel.fromJson(e))
        .take(5)
        .toList();

    return values;
  }

  @override
  Future<List<MealModel>> getSeafoodMeals() async {
    final response = await apiClient.get('filter.php?c=Seafood');
    final respValue = response['meals'];

    List<MealModel> values = (respValue as Iterable)
        .map((e) => MealModel.fromJson(e))
        .take(5)
        .toList();

    return values;
  }
}
