import 'package:hive_flutter/adapters.dart';
part 'team_member_model.g.dart';

@HiveType(typeId: 2)
class TeamMemberModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String? image;

   @HiveField(2)
  final String id;

  TeamMemberModel({required this.name, required this.image,required this.id});
}
