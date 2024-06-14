import 'dart:async';
import 'dart:io';

Stream<String> periodicStringStream(String input, Duration period) async* {
  for (int i = 0; i < input.length; i++) {
    yield input[i];
    await Future.delayed(period);
  }
}

void main() async {
  String myString = "Hello, World!";
  Duration period = Duration(seconds: 1);

  StreamSubscription<String> subscription;
  bool isPaused = false;

  subscription = periodicStringStream(myString, period).listen((char) {
    stdout.write(char);
  });

  // Pausing and resuming the stream for demonstration purposes
  Timer(Duration(seconds: 5), () {
    print('\nPausing stream');
    subscription.pause();
    isPaused = true;
  });

  Timer(Duration(seconds: 10), () {
    if (isPaused) {
      print('\nResuming stream');
      subscription.resume();
    }
  });
}
