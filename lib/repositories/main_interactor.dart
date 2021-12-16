import 'package:rxdart/rxdart.dart';
import 'package:teste_rxdart/repositories/main_input_boundary.dart';
import 'package:teste_rxdart/repositories/main_output_boundary.dart';
import 'dart:async';
import 'dart:math' as Math;

class MainInteractorImp implements MainInputBoundary, MainOutputBoundary {
  int _contador1 = Math.Random().nextInt(100);
  int _contador2 = Math.Random().nextInt(100);
  int _contador3 = Math.Random().nextInt(100);
  bool isStop = false;
  final BehaviorSubject<String> _t1 = BehaviorSubject<String>.seeded('');

  final BehaviorSubject<String> _t2 = BehaviorSubject<String>.seeded('');

  final BehaviorSubject<String> _t3 = BehaviorSubject<String>.seeded('');

  @override
  Stream<String> observeT1() => _t1.stream;
  @override
  Stream<String> observeT2() => _t2.stream;

  @override
  Stream<String> observeT3() => _t3.stream;

  @override
  Future<void> startCount() {
    isStop = false;

    return Future.delayed(Duration(seconds: 2)).then((value) => processCount());
  }

  @override
  Future<void> stopCount() {
    isStop = true;
    return Future.value(null);
  }

  void processCount() {
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      _t1.sink.add(_contador1.toString());
      _contador1 = Math.Random().nextInt(100);
      if (isStop) {
        timer.cancel();
      }
    });

    Timer.periodic(Duration(seconds: 2), (timer) {
      _t2.sink.add(_contador2.toString());
      _contador2 = Math.Random().nextInt(100);
      if (isStop) {
        timer.cancel();
      }
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      _t3.sink.add(_contador3.toString());
      _contador3 = Math.Random().nextInt(100);
      if (isStop) {
        timer.cancel();
      }
    });
  }
}
