import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:t_rent/src/core/domain/interactors/auth_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/file_interactor.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final AuthInteractor _authInteractor;
  final DataInteractor _dataInteractor;
  final FileInteractor _fileInteractor;
  UserDetailsCubit(
    this._authInteractor,
    this._dataInteractor,
    this._fileInteractor,
  ) : super(
          const UserDetailsState(
            route: CustomizedRoute(
              null,
              null,
            ),
            dateOfBirth: null,
            image: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<XFile?>? _imageSubscription;

  User? get currentUser => _authInteractor.currentUser;

  @override
  Future<void> close() {
    _imageSubscription?.cancel();
    _imageSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _imageSubscription?.cancel();
    _imageSubscription = _fileInteractor.imageStream.listen(
      _onNewImage,
    );
  }

  Future<void> updateProfile(ProfileModel profile) async {
    return _dataInteractor.updateProfile(profile);
  }

  Future<void> getImage() async {
    return _fileInteractor.getImage();
  }

  Future<void> _uploadAvatar(XFile? avatar) async {
    return _dataInteractor.uploadAvatar(avatar);
  }

  void _onNewImage(XFile? image) {
    emit(
      state.copyWith(
        image: image,
      ),
    );

    _uploadAvatar(image);
  }

  void navigateToMain() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          MainRoute(),
          shouldClearStack: true,
        ),
      ),
    );
  }

  void updateDateOfBirth(DateTime? dateOfBirth) {
    emit(
      state.copyWith(
        dateOfBirth: dateOfBirth,
      ),
    );
  }

  Future<void> updateUserDetails(ProfileModel profile) async {
    return _dataInteractor.updateProfile(
      profile.copyWith(
        dateOfBirth: state.dateOfBirth,
      ),
    );
  }
}
