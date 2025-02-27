import 'package:titik_merah/model/institution_model.dart';
import 'package:titik_merah/data/institution_data.dart';
import 'package:titik_merah/model/institution_score_model.dart';

class InstitutionService {
  // Using a mutable list from dummy data.
  final List<Institution> _institutions = List.from(institutionsDummyData);

  Future<List<Institution>> getAllInstitutions() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _institutions;
  }

  Future<Institution?> getInstitutionById(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    try {
      return _institutions.firstWhere((inst) => inst.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<InstitutionScore>> getSortedInstitutions(bool showClean) async {
    List<Institution> institutions = await getAllInstitutions();
    List<InstitutionScore> scoredInstitutions = institutions.map((inst) {
      int score = (inst.greenReports * 1) +
          (inst.yellowReports * -1) +
          (inst.redReports * -2);
      return InstitutionScore(institution: inst, score: score);
    }).toList();

    if (showClean) {
      // Higher score is cleaner.
      scoredInstitutions.sort((a, b) => b.score.compareTo(a.score));
    } else {
      // Lower score is more corrupt.
      scoredInstitutions.sort((a, b) => a.score.compareTo(b.score));
    }
    return scoredInstitutions;
  }
}
