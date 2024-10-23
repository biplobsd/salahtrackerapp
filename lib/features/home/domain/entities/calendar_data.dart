import 'package:json_annotation/json_annotation.dart';

part 'calendar_data.g.dart';

@JsonSerializable()
class CalendarData {
  CalendarData({
    required this.code,
    required this.status,
    required this.data,
  });

  final int? code;
  final String? status;
  final List<Datum>? data;

  CalendarData copyWith({
    int? code,
    String? status,
    List<Datum>? data,
  }) {
    return CalendarData(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory CalendarData.fromJson(Map<String, dynamic> json) =>
      _$CalendarDataFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarDataToJson(this);

  @override
  String toString() {
    return "$code, $status, $data, ";
  }
}

@JsonSerializable()
class Datum {
  Datum({
    required this.timings,
    required this.date,
    required this.meta,
  });

  final Timings? timings;
  final Date? date;
  final Meta? meta;

  Datum copyWith({
    Timings? timings,
    Date? date,
    Meta? meta,
  }) {
    return Datum(
      timings: timings ?? this.timings,
      date: date ?? this.date,
      meta: meta ?? this.meta,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  String toString() {
    return "$timings, $date, $meta, ";
  }
}

@JsonSerializable()
class Date {
  Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  final String? readable;
  final String? timestamp;
  final Gregorian? gregorian;
  final Hijri? hijri;

  Date copyWith({
    String? readable,
    String? timestamp,
    Gregorian? gregorian,
    Hijri? hijri,
  }) {
    return Date(
      readable: readable ?? this.readable,
      timestamp: timestamp ?? this.timestamp,
      gregorian: gregorian ?? this.gregorian,
      hijri: hijri ?? this.hijri,
    );
  }

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);

  @override
  String toString() {
    return "$readable, $timestamp, $gregorian, $hijri, ";
  }
}

@JsonSerializable()
class Gregorian {
  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  final String? date;
  final String? format;
  final String? day;
  final GregorianWeekday? weekday;
  final GregorianMonth? month;
  final String? year;
  final Designation? designation;

  Gregorian copyWith({
    String? date,
    String? format,
    String? day,
    GregorianWeekday? weekday,
    GregorianMonth? month,
    String? year,
    Designation? designation,
  }) {
    return Gregorian(
      date: date ?? this.date,
      format: format ?? this.format,
      day: day ?? this.day,
      weekday: weekday ?? this.weekday,
      month: month ?? this.month,
      year: year ?? this.year,
      designation: designation ?? this.designation,
    );
  }

  factory Gregorian.fromJson(Map<String, dynamic> json) =>
      _$GregorianFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianToJson(this);

  @override
  String toString() {
    return "$date, $format, $day, $weekday, $month, $year, $designation, ";
  }
}

@JsonSerializable()
class Designation {
  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  final String? abbreviated;
  final String? expanded;

  Designation copyWith({
    String? abbreviated,
    String? expanded,
  }) {
    return Designation(
      abbreviated: abbreviated ?? this.abbreviated,
      expanded: expanded ?? this.expanded,
    );
  }

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);

  Map<String, dynamic> toJson() => _$DesignationToJson(this);

  @override
  String toString() {
    return "$abbreviated, $expanded, ";
  }
}

@JsonSerializable()
class GregorianMonth {
  GregorianMonth({
    required this.number,
    required this.en,
  });

  final int? number;
  final String? en;

  GregorianMonth copyWith({
    int? number,
    String? en,
  }) {
    return GregorianMonth(
      number: number ?? this.number,
      en: en ?? this.en,
    );
  }

  factory GregorianMonth.fromJson(Map<String, dynamic> json) =>
      _$GregorianMonthFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianMonthToJson(this);

  @override
  String toString() {
    return "$number, $en, ";
  }
}

@JsonSerializable()
class GregorianWeekday {
  GregorianWeekday({
    required this.en,
  });

  final String? en;

  GregorianWeekday copyWith({
    String? en,
  }) {
    return GregorianWeekday(
      en: en ?? this.en,
    );
  }

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) =>
      _$GregorianWeekdayFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianWeekdayToJson(this);

  @override
  String toString() {
    return "$en, ";
  }
}

@JsonSerializable()
class Hijri {
  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  final String? date;
  final String? format;
  final String? day;
  final HijriWeekday? weekday;
  final HijriMonth? month;
  final String? year;
  final Designation? designation;
  final List<String>? holidays;

  Hijri copyWith({
    String? date,
    String? format,
    String? day,
    HijriWeekday? weekday,
    HijriMonth? month,
    String? year,
    Designation? designation,
    List<String>? holidays,
  }) {
    return Hijri(
      date: date ?? this.date,
      format: format ?? this.format,
      day: day ?? this.day,
      weekday: weekday ?? this.weekday,
      month: month ?? this.month,
      year: year ?? this.year,
      designation: designation ?? this.designation,
      holidays: holidays ?? this.holidays,
    );
  }

  factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);

  Map<String, dynamic> toJson() => _$HijriToJson(this);

  @override
  String toString() {
    return "$date, $format, $day, $weekday, $month, $year, $designation, $holidays, ";
  }
}

@JsonSerializable()
class HijriMonth {
  HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
  });

  final int? number;
  final String? en;
  final String? ar;

  HijriMonth copyWith({
    int? number,
    String? en,
    String? ar,
  }) {
    return HijriMonth(
      number: number ?? this.number,
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }

  factory HijriMonth.fromJson(Map<String, dynamic> json) =>
      _$HijriMonthFromJson(json);

  Map<String, dynamic> toJson() => _$HijriMonthToJson(this);

  @override
  String toString() {
    return "$number, $en, $ar, ";
  }
}

@JsonSerializable()
class HijriWeekday {
  HijriWeekday({
    required this.en,
    required this.ar,
  });

  final String? en;
  final String? ar;

  HijriWeekday copyWith({
    String? en,
    String? ar,
  }) {
    return HijriWeekday(
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }

  factory HijriWeekday.fromJson(Map<String, dynamic> json) =>
      _$HijriWeekdayFromJson(json);

  Map<String, dynamic> toJson() => _$HijriWeekdayToJson(this);

  @override
  String toString() {
    return "$en, $ar, ";
  }
}

@JsonSerializable()
class Meta {
  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  final double? latitude;
  final double? longitude;
  final String? timezone;
  final Method? method;
  final String? latitudeAdjustmentMethod;
  final String? midnightMode;
  final String? school;
  final Map<String, int>? offset;

  Meta copyWith({
    double? latitude,
    double? longitude,
    String? timezone,
    Method? method,
    String? latitudeAdjustmentMethod,
    String? midnightMode,
    String? school,
    Map<String, int>? offset,
  }) {
    return Meta(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timezone: timezone ?? this.timezone,
      method: method ?? this.method,
      latitudeAdjustmentMethod:
          latitudeAdjustmentMethod ?? this.latitudeAdjustmentMethod,
      midnightMode: midnightMode ?? this.midnightMode,
      school: school ?? this.school,
      offset: offset ?? this.offset,
    );
  }

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  @override
  String toString() {
    return "$latitude, $longitude, $timezone, $method, $latitudeAdjustmentMethod, $midnightMode, $school, $offset, ";
  }
}

@JsonSerializable()
class Method {
  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  final int? id;
  final String? name;
  final Params? params;
  final Location? location;

  Method copyWith({
    int? id,
    String? name,
    Params? params,
    Location? location,
  }) {
    return Method(
      id: id ?? this.id,
      name: name ?? this.name,
      params: params ?? this.params,
      location: location ?? this.location,
    );
  }

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);

  @override
  String toString() {
    return "$id, $name, $params, $location, ";
  }
}

@JsonSerializable()
class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  Location copyWith({
    double? latitude,
    double? longitude,
  }) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  String toString() {
    return "$latitude, $longitude, ";
  }
}

@JsonSerializable()
class Params {
  Params({
    required this.fajr,
    required this.isha,
  });

  @JsonKey(name: 'Fajr')
  final int? fajr;

  @JsonKey(name: 'Isha')
  final int? isha;

  Params copyWith({
    int? fajr,
    int? isha,
  }) {
    return Params(
      fajr: fajr ?? this.fajr,
      isha: isha ?? this.isha,
    );
  }

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);

  @override
  String toString() {
    return "$fajr, $isha, ";
  }
}

@JsonSerializable()
class Timings {
  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  @JsonKey(name: 'Fajr')
  final String? fajr;

  @JsonKey(name: 'Sunrise')
  final String? sunrise;

  @JsonKey(name: 'Dhuhr')
  final String? dhuhr;

  @JsonKey(name: 'Asr')
  final String? asr;

  @JsonKey(name: 'Sunset')
  final String? sunset;

  @JsonKey(name: 'Maghrib')
  final String? maghrib;

  @JsonKey(name: 'Isha')
  final String? isha;

  @JsonKey(name: 'Imsak')
  final String? imsak;

  @JsonKey(name: 'Midnight')
  final String? midnight;

  @JsonKey(name: 'Firstthird')
  final String? firstthird;

  @JsonKey(name: 'Lastthird')
  final String? lastthird;

  Timings copyWith({
    String? fajr,
    String? sunrise,
    String? dhuhr,
    String? asr,
    String? sunset,
    String? maghrib,
    String? isha,
    String? imsak,
    String? midnight,
    String? firstthird,
    String? lastthird,
  }) {
    return Timings(
      fajr: fajr ?? this.fajr,
      sunrise: sunrise ?? this.sunrise,
      dhuhr: dhuhr ?? this.dhuhr,
      asr: asr ?? this.asr,
      sunset: sunset ?? this.sunset,
      maghrib: maghrib ?? this.maghrib,
      isha: isha ?? this.isha,
      imsak: imsak ?? this.imsak,
      midnight: midnight ?? this.midnight,
      firstthird: firstthird ?? this.firstthird,
      lastthird: lastthird ?? this.lastthird,
    );
  }

  factory Timings.fromJson(Map<String, dynamic> json) =>
      _$TimingsFromJson(json);

  Map<String, dynamic> toJson() => _$TimingsToJson(this);

  @override
  String toString() {
    return "$fajr, $sunrise, $dhuhr, $asr, $sunset, $maghrib, $isha, $imsak, $midnight, $firstthird, $lastthird, ";
  }
}
