import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(HomepageInitial());

  Future<void> getUserDetails({required String id}) async {
    emit(HomepageLoading());
    print("===============================loading");
    try {
      var snapshot =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
      print(snapshot);
      emit(HomepageSuccess(snapshot: snapshot));
    } catch (e) {
      emit(HomepageFailure());
    }
  }
}
