import 'package:ecommerce/features/add_products/bloc/add_products_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String name = '';
  String desc = '';
  double price = 0.0;
  String status = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  final AddProductsBloc addProductsBloc = AddProductsBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          'Add Product',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey('name'),
                controller: nameController,
                decoration:
                    const InputDecoration(hintText: 'Enter Product name'),
                onSaved: (newValue) {
                  setState(() {
                    name = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter name';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: const ValueKey('Description'),
                controller: descController,
                decoration: const InputDecoration(
                    hintText: 'Enter Product Description'),
                onSaved: (newValue) {
                  setState(() {
                    desc = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Description';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: const ValueKey('price'),
                controller: priceController,
                decoration:
                    const InputDecoration(hintText: 'Enter Product Price'),
                onSaved: (newValue) {
                  setState(() {
                    price = double.parse(newValue!);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Price';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: const ValueKey('status'),
                controller: statusController,
                decoration:
                    const InputDecoration(hintText: 'Enter Product Status'),
                onSaved: (newValue) {
                  setState(() {
                    status = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Status';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          addProductsBloc.add(AddProductsDataEvent(
                              productName: name,
                              description: desc,
                              price: price,
                              status: status));
                        }
                      },
                      child: const Text(
                        'Add Product',
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
