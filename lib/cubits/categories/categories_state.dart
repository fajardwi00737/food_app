part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable{
  const CategoriesState();

  @override
  List<Object>get props => [];
}

class CategoriesInitial extends CategoriesState{}
class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}
class CategoriesSuccess extends CategoriesState{
  CategoriesSuccess(this.categoriesData);

  final List<Category> categoriesData;

  @override
  List<Object> get props => [categoriesData];
}
class CategoriesFailed extends CategoriesState{
  final String failedMessage;
  CategoriesFailed(this.failedMessage);
}

class CategoriesError extends CategoriesState{
  final String errorMessage;
  CategoriesError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
