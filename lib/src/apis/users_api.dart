import 'package:fun_pro_pkg/fun_pro_pkg.dart';
import 'package:http/http.dart';

import '../commons.dart';
import '../models.dart';

final class UsersApi with ApiCommon {
  Future<Coin<List<UserModel>, Exception>> getUsers() => httpHelper.sendRequest(
        sender: () => get(createSecureUri(apiConfig.usersPath)),
        constructor: (List<dynamic> list) => List.unmodifiable(
            list.map<UserModel>((map) => UserModel.from(map))),
      );

  Future<Coin<UserModel, Exception>> getUser(int id) => httpHelper.sendRequest(
        sender: () => get(createSecureUri('${apiConfig.usersPath}/$id')),
        constructor: UserModel.from,
      );
}
