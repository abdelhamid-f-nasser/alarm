class AlarmSettings {
  /// Model that contains all the settings to customize and set an alarm.
  ///
  /// Note that if you want to show a notification when alarm is triggered,
  /// both [notificationTitle] and [notificationBody] must not be null nor empty.
  AlarmSettings({
    required this.id,
    required this.dateTime,
    required this.assetAudioPath,
    this.loopAudio = true,
    this.vibrate = true,
    this.maxVolume = false,
    this.fadeDuration = 0.0,
    this.notificationTitle,
    this.notificationBody,
    this.enableNotificationOnKill = true,
  });

  /// Unique identifier assiocated with the alarm.
  final int id;

  /// Date and time when the alarm will be triggered.
  final DateTime dateTime;

  /// URL or path to audio asset to be used as the alarm ringtone.
  /// For iOS, you need to drag and drop your asset(s) to your `Runner` folder
  /// in Xcode and make sure 'Copy items if needed' is checked.
  ///
  ///
  /// Check out README.md for more informations.
  final String assetAudioPath;

  /// If `true`, [assetAudioPath] will repeat indefinitely until alarm is stopped.
  final bool loopAudio;

  /// If `true`, alarm volume will be set to the maximum.
  ///
  /// If `false`, it will be set to the current volume of the device.
  ///
  /// `false` by default.
  final bool maxVolume;

  /// If `true`, device will vibrate for 500ms, pause for 500ms and repeat until
  /// alarm is stopped.
  ///
  /// If [loopAudio] is set to `false`, vibrations will stop when audio ends.
  final bool vibrate;

  /// Duration, in seconds, over which to fade the alarm ringtone.
  ///
  /// Set to `0.0` by default, which means no fade.
  final double fadeDuration;

  /// Title of the notification to be shown when alarm is triggered.
  ///
  /// Must not be null nor empty to show a notification.
  final String? notificationTitle;

  /// Body of the notification to be shown when alarm is triggered.
  ///
  /// Must not be null nor empty to show a notification.
  final String? notificationBody;

  /// Whether to show a notification when application is killed to warn
  /// the user that the alarms won't ring anymore.
  ///
  /// Enabled by default.
  final bool enableNotificationOnKill;

  /// Creates a copy of [AlarmSettings] but with the given fields replaced with
  /// the new values.
  AlarmSettings copyWith({
    DateTime? dateTime,
    String? assetAudioPath,
    bool? loopAudio,
    bool? vibrate,
    bool? maxVolume,
    double? fadeDuration,
    String? notificationTitle,
    String? notificationBody,
  }) {
    return AlarmSettings(
      id: id,
      dateTime: dateTime ?? this.dateTime,
      assetAudioPath: assetAudioPath ?? this.assetAudioPath,
      loopAudio: loopAudio ?? this.loopAudio,
      maxVolume: maxVolume ?? this.maxVolume,
      vibrate: vibrate ?? this.vibrate,
      fadeDuration: fadeDuration ?? this.fadeDuration,
      notificationTitle: notificationTitle ?? this.notificationTitle,
      notificationBody: notificationBody ?? this.notificationBody,
    );
  }

  /// Constructs an [AlarmSettings] instance from the given JSON data.
  factory AlarmSettings.fromJson(Map<String, dynamic> json) => AlarmSettings(
        id: json['id'] as int,
        dateTime: DateTime.fromMicrosecondsSinceEpoch(json['dateTime'] as int),
        assetAudioPath: json['assetAudioPath'] as String,
        loopAudio: json['loopAudio'] as bool,
        maxVolume: json['maxVolume'] as bool,
        vibrate: json['vibrate'] as bool,
        fadeDuration: json['fadeDuration'] as double,
        notificationTitle: json['notificationTitle'] as String?,
        notificationBody: json['notificationBody'] as String?,
      );

  /// Converts this [AlarmSettings] instance to JSON data.
  Map<String, dynamic> toJson() => {
        'id': id,
        'dateTime': dateTime.microsecondsSinceEpoch,
        'assetAudioPath': assetAudioPath,
        'loopAudio': loopAudio,
        'maxVolume': maxVolume,
        'vibrate': vibrate,
        'fadeDuration': fadeDuration,
        'notificationTitle': notificationTitle,
        'notificationBody': notificationBody,
      };

  /// Returns all the properties of [AlarmSettings] for debug purposes.
  @override
  String toString() {
    Map<String, dynamic> json = toJson();
    json['dateTime'] = DateTime.fromMicrosecondsSinceEpoch(json['dateTime']);
    return "AlarmSettings: ${json.toString()}";
  }
}
