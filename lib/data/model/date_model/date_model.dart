class DateModel {
  DateModel({required this.date, required this.week});

  final String date;
  final String week;

  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      date: json['date'] as String? ?? '',
      week: json['week'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'week': week,
    };
  }

  static DateModel initial() => DateModel(
        date: '',
        week: '',
      );
}
