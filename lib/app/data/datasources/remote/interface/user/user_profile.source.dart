import 'package:limonfy/app/data/models/user/user_profile_response.model.dart';

abstract class UserProfileRemoteSource {
  Future<UserProfileResponseModel> getUserProfile();
}
