part of 'navigation_to_do_cubit.dart';

class NavigationToDoState extends Equatable {
  final CollectionId? selectedCollectionId;
  final bool? isSecondBodyDisplayed;
  const NavigationToDoState({
    this.selectedCollectionId,
    this.isSecondBodyDisplayed,
  });

  @override
  List<Object?> get props => [
        isSecondBodyDisplayed,
        selectedCollectionId,
      ];
}
