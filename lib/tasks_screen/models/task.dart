class Schedule {
  final DateTime dueDate;
  final bool enabled;

  Schedule({this.dueDate, this.enabled});

  Schedule.fromJson(Map<String, dynamic> json)
      : dueDate = json['dueDate'],
        enabled = json['enabled'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'dueDate': dueDate.toString(),
      'enabled': enabled,
    };
  }
}

class Alarm {
  final DateTime dueDate;
  final bool enabled;

  Alarm({this.dueDate, this.enabled});

  Alarm.fromJson(Map<String, dynamic> json)
      : dueDate = json['dueDate'],
        enabled = json['enabled'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'dueDate': dueDate.toString(),
      'enabled': enabled,
    };
  }
}

class Task {
  final String name;
  final DateTime dateCreated;
  final Schedule schedule;
  final Alarm alarm;

  Task({this.name, this.dateCreated, this.schedule, this.alarm});

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        dateCreated = json['dateCreated'],
        schedule = json['schedule'],
        alarm = json['alarm'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'dateCreated': dateCreated.toString(),
      'schedule': schedule,
      'alarm': alarm,
    };
  }
}
