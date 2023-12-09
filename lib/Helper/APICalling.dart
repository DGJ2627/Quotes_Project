import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/qutoes_model.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper qutoes_api = APIHelper._();

  Future<List<Quotes_Model>> getPosts() async {
    const String postsURL = "https://zenquotes.io/api/quotes";

    http.Response res = await http.get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List body = jsonDecode(res.body);

      List<Quotes_Model> posts =
          body.map((e) => Quotes_Model.fromMap(data: e)).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
