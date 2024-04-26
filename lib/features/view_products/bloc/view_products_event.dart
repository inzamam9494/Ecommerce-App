part of 'view_products_bloc.dart';

@immutable
sealed class ViewProductsEvent {}

class ViewProductInitialFetchEvent extends ViewProductsEvent{

}
