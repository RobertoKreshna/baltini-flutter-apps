// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 2;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      id: fields[0] as String,
      orderDate: fields[1] as DateTime,
      products: (fields[2] as List).cast<Product>(),
      qty: (fields[3] as List).cast<int>(),
      totalPrice: fields[4] as String,
      paymentMethod: fields[5] as String,
      paymentDate: fields[6] as DateTime,
      shippingMethod: fields[7] as String,
      shippingAddress: fields[8] as Address,
      billingAddress: fields[9] as Address,
      sizeIndex: (fields[10] as List).cast<int>(),
      subTotal: fields[11] as String,
      shippingCost: fields[12] as String,
      importDutyTaxes: fields[13] as String,
      email: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.orderDate)
      ..writeByte(2)
      ..write(obj.products)
      ..writeByte(3)
      ..write(obj.qty)
      ..writeByte(4)
      ..write(obj.totalPrice)
      ..writeByte(5)
      ..write(obj.paymentMethod)
      ..writeByte(6)
      ..write(obj.paymentDate)
      ..writeByte(7)
      ..write(obj.shippingMethod)
      ..writeByte(8)
      ..write(obj.shippingAddress)
      ..writeByte(9)
      ..write(obj.billingAddress)
      ..writeByte(10)
      ..write(obj.sizeIndex)
      ..writeByte(11)
      ..write(obj.subTotal)
      ..writeByte(12)
      ..write(obj.shippingCost)
      ..writeByte(13)
      ..write(obj.importDutyTaxes)
      ..writeByte(14)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
