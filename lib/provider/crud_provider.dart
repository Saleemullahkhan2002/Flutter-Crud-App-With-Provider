import 'package:flutter/material.dart';

class CrudProvider with ChangeNotifier {
 
  List data = [
    {'Name': 'saleem', 'ID': '07'},
    {'Name': 'saad', 'ID': '14'},
  ];
  void addUser(String name, String id) {
    data.add({
      'Name': name,
      'ID': id,
    });

    notifyListeners();
  }

  editUser( index , name , id) {
    data[index] = {'Name': name ,'ID':id};
   

    notifyListeners();
  }

  deleteUser(index) {
    data.removeAt(index);
    notifyListeners();
  }
}
