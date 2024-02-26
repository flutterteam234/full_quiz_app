// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizHiveModelAdapter extends TypeAdapter<QuizHiveModel> {
  @override
  final int typeId = 1;

  @override
  QuizHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizHiveModel(
      quizModels: (fields[0] as List?)?.cast<Questions?>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuizHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.quizModels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
