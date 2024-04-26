part of 'edit_products_bloc.dart';

@immutable
sealed class EditProductsEvent {}

class EditProductSubmittedEvent extends EditProductsEvent{
  final String productName;
  final String description;
  final double price;
  final String status;
  final String productId;

  EditProductSubmittedEvent({
    required this.productName,
    required this.description,
    required this.price,
    required this.status,
    required this.productId
  });
}
