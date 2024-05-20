class SpecializationModel {
  final String id;
  final int order;
  final String name;
  final String description;
  final String departmentId;
  final String imageUrl;


  SpecializationModel({
    required this.id,
    required this.order,
    required this.name,
    required this.description,
    required this.departmentId,
    required this.imageUrl,

  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    return SpecializationModel(
      id: json['id'] as String? ?? "",
      order: json['order'] as int? ?? 0,
      name: json['name']as String? ?? "",
      description: json['description']as String? ?? "",
      departmentId: json['department_id']as String? ?? "",
      imageUrl: json['image_url']as String? ?? "",

    );
  }
}
