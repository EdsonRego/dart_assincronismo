import 'dart:async';

import 'package:dart_assincronismo/api_key.dart';
import 'package:http/http.dart';
import 'dart:convert';

StreamController<String> streamController = StreamController<String>();

void main() {
  print("Olá mundo assincrono!");

  StreamSubscription streamSubscription = streamController.stream.listen((
    String info,
  ) {
    print(info);
  });

  requestData();
  requestDataAssync();
  sendDataAsync({
    "id": "NEW001",
    "name": "Flutter",
    "lastName": "Dart",
    "balance": 5000,
  });
}

requestData() {
  String url =
      "https://gist.githubusercontent.com/EdsonRego/0c4f212c76568e778d4465242d475afa/raw/25ff3011edfed3ebcb4b7c7d6bb6d1b6ce93654e/accounts.json";

  Future<Response> futureResponse = get(Uri.parse(url));
  futureResponse.then((Response response) {
    streamController.add("${DateTime.now()} | Requisição de leitura (usando then)");
  });
}

Future<List<dynamic>> requestDataAssync() async {
  String url =
      "https://gist.githubusercontent.com/EdsonRego/0c4f212c76568e778d4465242d475afa/raw/25ff3011edfed3ebcb4b7c7d6bb6d1b6ce93654e/accounts.json";
  Response response = await get(Uri.parse(url));
  streamController.add("${DateTime.now()} | Requisição de leitura ");
  return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAssync();
  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);

  String url = "https://api.github.com/gists/0c4f212c76568e778d4465242d475afa";

  Response response = await post(
    Uri.parse(url),
    headers: {"Authorization": "Bearer $githubApiKey"},
    body: json.encode({
      "description": "account.json",
      "public": true,
      "files": {
        "accounts.json": {"content": content},
      },
    }),
  );

  if(response.statusCode.toString()[0] == "2"){
    streamController.add("${DateTime.now()} | Requisição bem sucedida (${mapAccount["name"]})");
  }else{
    streamController.add("${DateTime.now()} | Requisição bem falhou (${mapAccount["name"]})");
  }
}
