class TableModel {
  final String time;
  final bool status;
  final bool timeOfDay;

  TableModel({
    required this.time,
    required this.status,
    required this.timeOfDay,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      time: json['time'] as String? ?? '',
      status: json['status'] as bool? ?? false,
      timeOfDay: json['time_of_day'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'status': status,
      'time_of_day': timeOfDay,
    };
  }

  static TableModel initial() => TableModel(
        time: '',
        status: false,
        timeOfDay: false,
      );

  TableModel copyWith({
    String? time,
    bool? status,
    bool? timeOfDay,
  }) {
    return TableModel(
      time: time ?? this.time,
      status: status ?? this.status,
      timeOfDay: timeOfDay ?? this.timeOfDay,
    );
  }
}
