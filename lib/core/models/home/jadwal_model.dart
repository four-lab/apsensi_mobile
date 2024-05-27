class Jadwal {
  final String title;
  final List<JadwalItem> items;

  Jadwal({
    required this.title,
    required this.items,
  });

  factory Jadwal.sample() {
    return Jadwal(
      title: 'Jadwal Hari Ini',
      items: [
        JadwalItem(
          subject: 'Kimia',
          classInfo: 'XII BD-2',
          time: '09.30-11.00 WIB',
        ),
        JadwalItem(
          subject: 'Bimbingan Karir',
          classInfo: 'X AKL-2',
          time: '12:30 - 14:00 WIB',
        ),
      ],
    );
  }
}

class JadwalItem {
  final String subject;
  final String classInfo;
  final String time;

  JadwalItem({
    required this.subject,
    required this.classInfo,
    required this.time,
  });
}
