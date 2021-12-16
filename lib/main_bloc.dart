import 'package:rxdart/rxdart.dart';
import 'package:teste_rxdart/main_view_mode.dart';
import 'package:teste_rxdart/repositories/main_interactor.dart';

class MainBloc {
  final MainInteractorImp interactor = MainInteractorImp(); //repository
  final BehaviorSubject<Status> status =
      BehaviorSubject<Status>.seeded(Status.none);

  Stream<MainViewModel> get observeViewModel => CombineLatestStream.combine4<
          String, String, String, Status, MainViewModel>(
      interactor.observeT1(),
      interactor.observeT2(),
      interactor.observeT3(),
      status.stream,
      (a, b, c, d) => MainViewModel(a, b, c, d));

  void startCount() {
    status.add(Status.starting);
    interactor.startCount().then((value) => status.add(Status.processing));
  }

  void stopCount() =>
      interactor.stopCount().then((value) => status.add(Status.stoped));
}
