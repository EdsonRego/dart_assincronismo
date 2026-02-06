import 'package:http/http.dart';
import 'dart:convert';

void main() {
  print("Olá mundo assincrono!");
  requestData();
}

requestData() {
  String url =
      "https://gist.githubusercontent.com/EdsonRego/0c4f212c76568e778d4465242d475afa/raw/25ff3011edfed3ebcb4b7c7d6bb6d1b6ce93654e/accounts.json";

  Future<Response> futureResponse = get(Uri.parse(url));
  print(futureResponse);
  futureResponse.then((Response response) {
    print(response);
    print(response.body);
    List<dynamic> listAccounts = json.decode(response.body);
    Map<String, dynamic> mapCarla = listAccounts.firstWhere(
      (element) => element["name"] == "Carla",
    );
    print(mapCarla["balance"]);
  });

  print("Última coisa a acontecer na função");
}
