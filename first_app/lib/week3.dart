import 'package:flutter/material.dart';

class Week3 extends StatelessWidget {
  Week3({super.key});

  List<String> listProduct = ['Apple', 'Samsung', 'Oppo'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView")),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: listProduct.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('$index'),
            title: Text(listProduct[index]),
            subtitle: Text('loremlorem....'),
            trailing: Icon(Icons.edit),
          );
          // return Container(
          //   height: 200,
          //   width: double.infinity,
          //   color: Colors.red,
          //   child: Text()
        },
      ),
    );
  }
}
