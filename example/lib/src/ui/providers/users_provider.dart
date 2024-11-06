import 'package:fake_store_api_pkg/fake_store_api_pkg.dart';
import 'package:flutter/material.dart';

final class UsersProvider extends ChangeNotifier {
  final UsersApi _usersApi;

  List<UserModel> _users;
  Exception? _exception;

  UsersProvider()
      : _usersApi = UsersApi(),
        _users = List.empty();

  List<UserModel> get users => _users;
  Exception? get exception => _exception;

  bool get hasUsers => _users.isNotEmpty;
  bool get hasException => _exception != null;

  Future<void> getUsers() async {
    final coin = await _usersApi.getUsers();

    coin.flip<void>((users) {
      _users = users;
      _exception = null;
      notifyListeners();
    }, (exception) {
      _users = List.empty();
      _exception = exception;
      notifyListeners();
    });
  }
}
