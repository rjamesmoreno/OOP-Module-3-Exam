import 'dart:math';

class TumbleRecorder {
  String tumble;

  TumbleRecorder({
    required this.tumble,
  });
}

List<TumbleRecorder> userTumbles = [];

numberGenerator() {
  var randomize = new Random();
  int min = 10000000;
  int max = 20000000;
  int result = min + randomize.nextInt(max - min);
  return result;
}
