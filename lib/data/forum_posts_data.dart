// Dummy forum posts with assigned profiles
import 'package:titik_merah/data/institution_data.dart';
import 'package:titik_merah/data/profile_data.dart';
import 'package:titik_merah/model/forum_post_model.dart';

final List<ForumPost> forumPostsDummyData = [
  ForumPost(
    title: "Pengalaman Pungli di Samsat",
    description:
        "Saya mengalami pungli saat mengurus STNK di Samsat. Petugas meminta Rp200 ribu untuk mempercepat antrian. "
        "Apakah ini sudah biasa terjadi? Bagaimana cara melaporkannya dengan aman?",
    time: "12 min",
    category: "Korupsi",
    profile: profileDummyData[0], // Connected to Profile 1
    institution: institutionsDummyData[0], // Connected to Institution
  ),
  ForumPost(
    title: "Tips Urus SIM Tanpa Bayar",
    description:
        "Bagi yang ingin mengurus SIM tanpa pungli, berikut beberapa tips yang bisa saya bagikan:\n"
        "- Siapkan semua dokumen dengan lengkap\n"
        "- Ikuti prosedur resmi dan jangan tergoda membayar calo\n"
        "- Jika ada indikasi pungli, catat bukti dan laporkan",
    time: "25 May",
    category: "Positif",
    profile: profileDummyData[1], // Connected to Profile 2
    institution: institutionsDummyData[0], // Connected to Institution
  ),
  ForumPost(
    title: "Apakah Ada Perbaikan?",
    description:
        "Setelah beberapa laporan masuk mengenai pelayanan di Kantor Imigrasi, apakah ada perubahan kebijakan yang signifikan? "
        "Mohon info bagi yang sudah mengurus paspor belakangan ini.",
    time: "21 May",
    category: "Update",
    profile: profileDummyData[2], // Connected to Profile 3
    institution: institutionsDummyData[0], // Connected to Institution
  ),
];
