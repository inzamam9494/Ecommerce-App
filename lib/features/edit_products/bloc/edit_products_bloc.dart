import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'edit_products_event.dart';

part 'edit_products_state.dart';

class EditProductsBloc extends Bloc<EditProductsEvent, EditProductsState> {
  EditProductsBloc() : super(EditProductsInitial()) {
    on<EditProductSubmittedEvent>(editProductSubmittedEvent);
  }

  FutureOr<void> editProductSubmittedEvent(
      EditProductSubmittedEvent event, Emitter<EditProductsState> emit) async{
    try{
      await FirebaseFirestore.instance.collection('Product').doc(event.productId).update({
        'name': event.productName,
        'product' : event.description,
        'price' : event.price,
        'status' : event.status
      });
      log('Product Updated');
    }catch(e){
      log(e.toString());
    }
  }
}
