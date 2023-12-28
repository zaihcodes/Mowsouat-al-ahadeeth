part of 'hadeeth_bloc.dart';

class HadeethEvent extends Equatable {
  const HadeethEvent();

  @override
  List<Object> get props => [];
}

class GetHadeeth extends HadeethEvent {
  final String lang;
  final String hadeethId;

  const GetHadeeth({required this.lang, required this.hadeethId});
}
