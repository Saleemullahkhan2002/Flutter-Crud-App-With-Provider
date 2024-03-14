import 'package:crud_app_with_provider/provider/crud_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var crudProvider = Provider.of<CrudProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Crud App With Provider'),),
      body: Consumer<CrudProvider>(builder: (context, data, child) {
        return ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (Context, index) {
              return ListTile(
                  title: Text('Name : ${data.data[index]['Name']}'),
                  // subtitle: Text('ID : ${data[index]['id']}'),
                  subtitle: Text('ID ${data.data[index]['ID']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: nameController,
                                            decoration: InputDecoration(
                                                hintText: 'Edit Name',
                                                border: OutlineInputBorder()),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextField(
                                              controller: idController,
                                              decoration: InputDecoration(
                                                  hintText: 'Edit ID',
                                                  border: OutlineInputBorder()))
                                        ]),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            crudProvider.editUser(
                                                
                                                index,
                                                nameController.text,
                                                idController.text);
                                                Navigator.of(context).pop();
                                                nameController.clear();
                                                idController.clear();
                                          },
                                          child: Text('Save'))
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            data.deleteUser(index);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ));
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('add user'),
                    content: Column(mainAxisSize: MainAxisSize.min, children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Enter Name',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                          controller: idController,
                          decoration: InputDecoration(
                              hintText: 'Enter ID',
                              border: OutlineInputBorder()))
                    ]),
                    actions: [
                      TextButton(
                          onPressed: () {
                            crudProvider.addUser(
                                nameController.text, idController.text);
                            Navigator.of(context).pop();
                            nameController.clear();
                            idController.clear();
                          },
                          child: Text('Add'))
                    ]);
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
