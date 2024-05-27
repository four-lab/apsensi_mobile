class Profile {
  final String greeting;
  final String name;
  final String phoneNumber;

  Profile({
    required this.greeting,
    required this.name,
    required this.phoneNumber,
  });

  factory Profile.sample() {
    return Profile(
      greeting: 'Hello,',
      name: 'Irsyadul Ibad',
      phoneNumber: '3456245678',
    );
  }
}
