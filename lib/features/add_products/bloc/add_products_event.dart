part of 'add_products_bloc.dart';

@immutable
sealed class AddProductsEvent {}

class AddProductsDataEvent extends AddProductsEvent{
  final String productName;
  final String description;
  final double price;
  final String status;

  AddProductsDataEvent({
    required this.productName,
    required this.description,
    required this.price,
    required this.status,
  });
}
