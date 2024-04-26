import 'package:ecommerce/features/add_products/bloc/add_products_bloc.dart';
import 'package:ecommerce/features/edit_products/bloc/edit_products_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class EditProductsPage extends StatefulWidget {
  final String productName;
  final String description;
  final double price;
  final String status;
  final String productId;

  const EditProductsPage({Key? key,
    required this.productName,
    required this.description,
    required this.price,
    required this.status,
    required this.productId})
      : super(key: key);

  @override
  State<EditProductsPage> createState() => _EditProductsPageState();
}

class _EditProductsPageState extends State<EditProductsPage> {
  String name = '';
  String desc = '';
  double price = 0.0;
  String status = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  EditProductsBloc editProductsBloc = EditProductsBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.productName;
    descController.text = widget.description;
    priceController.text = widget.price.toString();
    statusController.text = widget.status;
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
                          editProductsBloc.add(EditProductSubmittedEvent(
                              productName: name,
                              description: desc,
                              price: price,
                              status: status,
                              productId: widget.productId));
                        }
                      },
                      child: const Text(
                        'Update Products',
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
