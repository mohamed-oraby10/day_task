// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectModelAdapter extends TypeAdapter<ProjectModel> {
  @override
  final int typeId = 2;

  @override
  ProjectModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectModel(
      userId: fields[7] as String,
      progressPercent: fields[4] as double,
      title: fields[0] as String,
      details: fields[1] as String,
      date: fields[2] as String,
      projectTeam: (fields[3] as List).cast<TeamMemberModel>(),
      projectTasks: (fields[5] as List).cast<TaskModel>(),
      completedTasks: (fields[6] as List).cast<TaskModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProjectModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.details)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.projectTeam)
      ..writeByte(4)
      ..write(obj.progressPercent)
      ..writeByte(5)
      ..write(obj.projectTasks)
      ..writeByte(6)
      ..write(obj.completedTasks)
      ..writeByte(7)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
