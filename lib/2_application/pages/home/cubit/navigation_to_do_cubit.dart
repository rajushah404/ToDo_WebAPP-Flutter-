import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';

part 'navigation_to_do_state.dart';

class NavigationToDoCubit extends Cubit<NavigationToDoState> {
  NavigationToDoCubit() : super(const NavigationToDoState());

  void selectedToDoCollectionChange(CollectionId collectionId) {
    debugPrint(collectionId.value);
    emit(NavigationToDoState(selectedCollectionId: collectionId));
  }

  void secondBodyHasChange({required bool isSecondBodyDisplayed}) {
    emit(
      NavigationToDoState(
        selectedCollectionId: state.selectedCollectionId,
        isSecondBodyDisplayed: isSecondBodyDisplayed,
      ),
    );
  }
}
