class LogPresensiService {
  static Future<List<Map<String, dynamic>>> fetchLogPresensi() async {
    // Simulating a network request
    await Future.delayed(Duration(seconds: 2));
    return [
      {
        'subject': 'Mathematics',
        'date': 'Kamis, 07 Maret 2024',
        'time': '13.00 - 15.00',
        'status': 'Hadir',
      },
      {
        'subject': 'Chemistry',
        'date': 'Kamis, 07 Maret 2024',
        'time': '13.00 - 15.00',
        'status': 'Telat',
      },
      {
        'subject': 'Biology',
        'date': 'Kamis, 07 Maret 2024',
        'time': '13.00 - 15.00',
        'status': 'Absen',
      },
      {
        'subject': 'Geography',
        'date': 'Kamis, 07 Maret 2024',
        'time': '13.00 - 15.00',
        'status': 'Izin',
      },
    ];
  }
}
