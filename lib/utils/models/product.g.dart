// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 3;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as String,
      title: fields[1] as String,
      vendor: fields[2] as String,
      productType: fields[3] as String,
      status: fields[4] as String,
      image: fields[5] as String,
      variant: (fields[8] as List).cast<dynamic>(),
      options: (fields[9] as List).cast<dynamic>(),
      images: (fields[10] as List).cast<dynamic>(),
      price: fields[6] as String,
      created: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.vendor)
      ..writeByte(3)
      ..write(obj.productType)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.created)
      ..writeByte(8)
      ..write(obj.variant)
      ..writeByte(9)
      ..write(obj.options)
      ..writeByte(10)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
