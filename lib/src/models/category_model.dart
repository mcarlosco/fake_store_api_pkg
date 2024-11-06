import '../utils/checkers_util.dart';

final class CategoryModel {
  final String name;

  CategoryModel.from(dynamic name) : this._(checkStringOrDefault(name));

  const CategoryModel._(this.name);

  @override
  String toString() => '"$name"';
}
