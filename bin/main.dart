import 'package:http/http.dart';

void main() {
  print("Olá mundo assincrono!");
  requestData();
}

requestData() {
  String url =
      "https://gist.githubusercontent.com/EdsonRego/0c4f212c76568e778d4465242d475afa/raw/25ff3011edfed3ebcb4b7c7d6bb6d1b6ce93654e/accounts.json";

  print(Uri.parse(url));
}
