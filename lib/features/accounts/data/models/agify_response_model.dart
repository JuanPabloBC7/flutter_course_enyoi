class AgifyResponseModel {
  final int count;
  final String name;
  final int age;

  AgifyResponseModel({
    required this.count,
    required this.name,
    required this.age,
  });

  factory AgifyResponseModel.fromJson(Map<String, dynamic> json) {
    return AgifyResponseModel(
      count: json['count'],
      name: json['name'],
      age: json['age'],
    );
  }
}
