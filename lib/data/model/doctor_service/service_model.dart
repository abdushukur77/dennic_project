class ServiceModel {
  ServiceModel({
    required this.createdAt,
    required this.doctorId,
    required this.duration,
    required this.id,
    required this.name,
    required this.offlinePrice,
    required this.onlinePrice,
    required this.order,
    required this.specializationId,
    required this.updatedAt,
  });

  final String createdAt;
  final String doctorId;
  final String duration;
  final String id;
  final String name;
  final int offlinePrice;
  final int onlinePrice;
  final int order;
  final String specializationId;
  final String updatedAt;

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      createdAt: json['created_at'] as String? ?? '',
      doctorId: json['doctor_id'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      offlinePrice: json['offline_price'] as int? ?? 0,
      onlinePrice: json['online_price'] as int? ?? 0,
      order: json['order'] as int? ?? 0,
      specializationId: json['specialization_id'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'doctor_id': doctorId,
      'duration': duration,
      'id': id,
      'name': name,
      'offline_price': offlinePrice,
      'online_price': onlinePrice,
      'order': order,
      'specialization_id': specializationId,
      'updated_at': updatedAt,
    };
  }
}
