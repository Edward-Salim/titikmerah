import 'package:titik_merah/data/profile_data.dart';
import 'package:titik_merah/model/profile_model.dart';

class ProfileService {
  final List<Profile> _profiles = List.from(profileDummyData);

  List<Profile> getAllProfiles() => _profiles;

  Future<Profile?> getProfileById(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    try {
      return _profiles.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  void createProfile(Profile profile) {
    _profiles.add(profile);
  }
}
