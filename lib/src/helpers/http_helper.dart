import 'dart:convert';

import 'package:fun_pro_pkg/fun_pro_pkg.dart';
import 'package:http/http.dart';

import '../exceptions.dart';

/// A helper for network communication with HTTP.
final class HttpHelper {
  const HttpHelper();

  /// Invokes [sender], which is delegated to send the HTTP [Request], and then invokes
  /// [constructor] iff the HTTP [Response] status code is 200 to create a [R] from a [T].
  Future<Coin<R, Exception>> sendRequest<R, T>({
    required Future<Response> Function() sender,
    required R Function(T) constructor,
  }) async {
    try {
      final response = await sender();

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        return Coin.heads(constructor(json));
      }

      return Coin.tails(ApiException());
    } catch (_) {
      return Coin.tails(UnknownException());
    }
  }
}
