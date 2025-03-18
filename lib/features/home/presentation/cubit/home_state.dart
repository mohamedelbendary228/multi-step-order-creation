part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<OrderEntity> orders;
  const HomeLoaded({required this.orders});
}

final class HomeFailure extends HomeState {
  final String message;
  const HomeFailure({required this.message});
}
