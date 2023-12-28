part of 'hadeeth_bloc.dart';

class HadeethState extends Equatable {
  const HadeethState();

  @override
  List<Object> get props => [];
}

class HadeethInitial extends HadeethState {}

class HadeethLoading extends HadeethState {}

class HadeethOffline extends HadeethState {}

class HadeethError extends HadeethState {
  final String message;
  const HadeethError({required this.message});

  @override
  List<Object> get props => [message];
}

class HadeethLoaded extends HadeethState {
  final Hadeeth hadeeth;
  const HadeethLoaded({required this.hadeeth});

  @override
  List<Object> get props => [hadeeth];
}
