import '../utils/checkers_util.dart';

final class CategoryModel {
  final String name;

  const CategoryModel(this.name);

  CategoryModel.from(dynamic name) : this(checkStringOrDefault(name));

  @override
  String toString() => '"$name"';
}
