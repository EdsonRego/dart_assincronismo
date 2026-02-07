import 'dart:io';
import 'package:dart_assincronismo/models/account.dart';
import 'package:dart_assincronismo/services/account_service.dart';


class AccountScreen {
  AccountService _accountService = AccountService();

  void initializeStream() {
    _accountService.streamInfos.listen((event) {
      print(event);
    });
  }

  void runChatBot() async {
    print("Bom dia! Eu sou o Lewis, assistente do Bando d'ouro!");
    print("Que bom te ter aqui com a gente.\n");

    bool isRunning = true;
    while (isRunning) {
      print("Como eu posso te ajuda? [Digite o número desejado]");
      print("1 - Ver todas as suas contas.");
      print("2 - Adiciona novas contas.");
      print("3 - Sair! \n");

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "1":
            {
              await _getAllAccounts();
              break;
            }
          case "2":
            {
              await _addExampleAccout();
              break;
            }
          case "3":
            {
              isRunning = false;
              print("Te vejo na próxima 👍");
              break;
            }
          default:
            {
              print("Não entendi! Digite novamente!");
            }
        }
      }
    }
  }

  _getAllAccounts() async {
    List<Account> listAccounts = await _accountService.getAll();
    print(listAccounts);
  }

  _addExampleAccout() async {
    Account example = Account(
      id: "ID555",
      name: "Harley",
      lastName: "Dayvison",
      balance: 2001.0,
    );
    await _accountService.addAccount(example);
  }
}
