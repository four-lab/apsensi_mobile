class StatusPresensi {
  final String title;
  final List<StatusPresensiItem> items;

  StatusPresensi({
    required this.title,
    required this.items,
  });

  factory StatusPresensi.sample() {
    return StatusPresensi(
      title: 'Presensi Saat Ini',
      items: [
        StatusPresensiItem(
          date: 'Jumat, 07 Maret 2024',
          time: '09.30-11.00',
          subject: 'Kimia',
        ),
      ],
    );
  }
}

class StatusPresensiItem {
  final String date;
  final String time;
  final String subject;

  StatusPresensiItem({
    required this.date,
    required this.time,
    required this.subject,
  });
}
