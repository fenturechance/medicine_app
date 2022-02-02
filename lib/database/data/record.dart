class Record {
  final int? id;
  final int? date;
  final int? morningEat;
  final int? noonEat;
  final int? eveningEat;
  final int? beforeSleepEat;
  Record(
      {this.id,
      this.date,
      this.morningEat,
      this.noonEat,
      this.eveningEat,
      this.beforeSleepEat});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'morningEat': morningEat,
      'noonEat': noonEat,
      'eveningEat': eveningEat,
      'beforeSleepEat': beforeSleepEat
    };
  }
}
