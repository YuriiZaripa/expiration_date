import 'package:expiration_date/domain/entities/supplier.dart';

abstract class OutputEvent {}

class SendNewProductsEvent extends OutputEvent {
  SendNewProductsEvent({required this.supplier,});

  final Supplier supplier;
}