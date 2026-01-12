import 'package:hidup_fit/data/models/question.dart';
import 'package:hidup_fit/data/models/section.dart';

final List<Section> questionnaireSections = [
  Section(
    id: 1,
    title: "BAB I\nSkrining Hepatitis C",
    questions: [
      Question(id: 1, text: "Apakah Anda pernah didiagnosis Hepatitis C oleh tenaga kesehatan?"),
      Question(id: 2, text: "Apakah Anda pernah mendapatkan hasil pemeriksaan darah dengan anti-HCV positif?"),
      Question(id: 3, text: "Apakah Anda memiliki riwayat transfusi darah atau tindakan medis invasif?"),
      Question(id: 4, text: "Apakah Anda memiliki riwayat penggunaan jarum suntik bersama atau tindakan nonmedis dengan alat tidak steril (misalnya tato/tindik)?"),
      Question(id: 5, text: "Apakah Anda pernah mengalami gejala ikterus (kulit atau sklera mata menguning), mual berkepanjangan, atau nyeri perut kanan atas?"),
    ],
  ),
  Section(
    id: 2,
    title: "BAB II\nSkrining Hepatitis B",
    questions: [
      Question(id: 6, text: "Apakah Anda pernah didiagnosis Hepatitis B atau memiliki hasil HBsAg positif?"),
      Question(id: 7, text: "Apakah terdapat anggota keluarga serumah yang menderita Hepatitis B?"),
      Question(id: 8, text: "Apakah Anda belum atau tidak yakin telah menerima vaksinasi Hepatitis B lengkap?"),
      Question(id: 9, text: "Apakah Anda memiliki riwayat transfusi darah, operasi, atau tindakan medis invasif?"),
      Question(id: 10, text: "Apakah Anda pernah mengalami keluhan lemas berkepanjangan, urine berwarna gelap, atau kulit dan mata menguning?"),
    ],
  ),
  Section(
    id: 3,
    title: "BAB III\nSkrining Tuberkulosis (TBC)",
    questions: [
      Question(id: 11, text: "Apakah Anda mengalami batuk berdahak selama ≥2 minggu?"),
      Question(id: 12, text: "Apakah batuk yang dialami disertai dahak bercampur darah?"),
      Question(id: 13, text: "Apakah Anda mengalami demam lama dan/atau keringat malam hari tanpa aktivitas berat?"),
      Question(id: 14, text: "Apakah terjadi penurunan berat badan tanpa sebab yang jelas?"),
      Question(id: 15, text: "Apakah Anda pernah melakukan kontak erat dengan pasien Tuberkulosis aktif?"),
    ],
  ),
  Section(
    id: 4,
    title: "BAB IV\nSkrining Thalasemia",
    questions: [
      Question(id: 16, text: "Apakah Anda pernah didiagnosis Thalasemia oleh tenaga kesehatan?"),
      Question(id: 17, text: "Apakah terdapat riwayat Thalasemia pada anggota keluarga kandung?"),
      Question(id: 18, text: "Apakah Anda sering mengalami anemia sejak usia anak atau remaja?"),
      Question(id: 19, text: "Apakah Anda pernah atau rutin menjalani transfusi darah?"),
      Question(id: 20, text: "Apakah Anda sering mengalami keluhan mudah lelah, pucat, atau sesak saat aktivitas ringan?"),
    ],
  ),
  Section(
    id: 5,
    title: "BAB V\nSkrining Diabetes Melitus",
    questions: [
      Question(id: 21, text: "Apakah Anda pernah didiagnosis Diabetes Melitus oleh tenaga kesehatan?"),
      Question(id: 22, text: "Apakah Anda sering mengalami rasa haus berlebihan dan sering buang air kecil?"),
      Question(id: 23, text: "Apakah Anda sering merasa lapar berlebihan disertai penurunan berat badan?"),
      Question(id: 24, text: "Apakah terdapat riwayat Diabetes Melitus pada keluarga sedarah?"),
      Question(id: 25, text: "Apakah hasil pemeriksaan gula darah Anda pernah menunjukkan nilai di atas normal?"),
    ],
  ),
];
