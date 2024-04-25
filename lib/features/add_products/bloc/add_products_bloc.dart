import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_products_event.dart';
part 'add_products_state.dart';

class AddProductsBloc extends Bloc<AddProductsDataEvent, AddProductsState> {
  AddProductsBloc() : super(AddProductsInitial()) {
    on<AddProductsDataEvent>(addProductDataEvent);
  }

  FutureOr<void> addProductDataEvent(AddProductsDataEvent event, Emitter<AddProductsState> emit) async {
    try{
      await FirebaseFirestore.instance.collection('Product').add({
        'name': event.productName,
        'product' : event.description,
        'price' : event.price,
        'status' : event.status
      });
      log('Product Added');
    }catch(e){
      log(e.toString());
    }
  }
}

