part of 'populars_cubit.dart';

abstract class PopularsState extends Equatable{
  const PopularsState();

  @override
  List<Object>get props => [];
}

class PopularsInitial extends PopularsState{}
class PopularsLoading extends PopularsState {
  const PopularsLoading();
}
class PopularsSuccess extends PopularsState{
  PopularsSuccess(this.popularsData);

  final List<Popular> popularsData;

  @override
  List<Object> get props => [popularsData];
}
class PopularsFailed extends PopularsState{
  final String failedMessage;
  PopularsFailed(this.failedMessage);
}
class PopularsError extends PopularsState{
  final String errorMessage;
  PopularsError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
