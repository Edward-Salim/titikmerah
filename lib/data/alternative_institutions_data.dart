
// Dummy data for alternative institutions with distances
import 'package:titik_merah/model/alternative_institution.dart';

final List<AlternativeInstitution> alternativeInstitutions = [
  AlternativeInstitution(
    institutionName: "Kantor Imigrasi Depok",
    reportCount: 10,
    distance: 2.5, // Close institution (< 3km)
  ),
  AlternativeInstitution(
    institutionName: "Dinas Kependudukan Bogor",
    reportCount: 5,
    distance: 3.8, // Too far (> 3km)
  ),
  AlternativeInstitution(
    institutionName: "Samsat Bandung",
    reportCount: 8,
    distance: 1.2, // Close institution (< 3km)
  ),
];
