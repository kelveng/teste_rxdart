enum Status { starting, processing, stoped, none }

class MainViewModel {
  final String t1;
  final String t2;
  final String t3;
  final Status status;

  MainViewModel(this.t1, this.t2, this.t3, this.status);
}
