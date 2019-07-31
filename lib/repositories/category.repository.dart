import 'package:dio/dio.dart';
import '../models/category-list-item.model.dart';
import '../settings.dart';

class CategoryRepository {
  Future<List<CategoryListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/categories";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => CategoryListItemModel.fromJson(course))
        .toList();
  }
}
