import 'package:flutter/cupertino.dart';
import 'package:provider_state_management/user.dart';

class HomeProvider extends ChangeNotifier {
  List<UserModel> users = [];
  bool isLoading = false;
  List<UserModel> addedUsers = [
    UserModel(name: 'AHmed mohamed', address: 'london'),
    UserModel(name: 'faarax hassan', address: 'mogadishu'),
  ];

  getUsers() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(
      Duration(seconds: 5),
      () {
        users.addAll(addedUsers);
        print('THE USERS $users');
        notifyListeners();
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
