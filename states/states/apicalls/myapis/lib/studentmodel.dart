class StudentModel{
  final String name;
   final String skill;
   final String eduaction;
   StudentModel({required this.name, required this.skill,required this.eduaction});
   factory StudentModel.fromJson(final json)

    name:Json("name");,
    education:
   }
}