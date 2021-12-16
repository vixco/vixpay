import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FetchMoreEvent extends Equatable {
  FetchMoreEvent([List props = const <dynamic>[]]) : super();
}

class Fetch extends FetchMoreEvent {
  @override
  List<Object> get props => [];
}

class Refresh extends FetchMoreEvent {
  @override
  List<Object> get props => [];
}

class ListViewIsNotScrollable extends FetchMoreEvent {
  @override
  List<Object> get props => [];
}

class AddItems extends FetchMoreEvent {
  final List? items;

  AddItems(this.items);

  @override
  List<Object?> get props => [items];
}
