import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          'Add Product',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              key: ValueKey('name'),
              decoration: InputDecoration(
                hintText: 'Enter Product name'
              ),
            ),
            TextFormField(
              key: ValueKey('description'),
              decoration: InputDecoration(
                  hintText: 'Enter Product Description'
              ),
            ),
            TextFormField(
              key: ValueKey('price'),
              decoration: InputDecoration(
                  hintText: 'Enter Product Price'
              ),
            ),
            TextFormField(
              key: ValueKey('status'),
              decoration: InputDecoration(
                  hintText: 'Enter Product Status'
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 50,
                width: double.maxFinite,
                child: ElevatedButton(onPressed: (){}, child: Text('Add Product')))
          ],
        ),
      ),
    );
  }
}
