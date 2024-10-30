class Call {
  final String name; // Caller’s name
  final String
      profileImage; // URL or asset path to the caller’s profile picture
  final String time; // Time of the call (e.g., "Today, 14:30")
  final String callType; // Call type (e.g., "Voice" or "Video")
  final bool isMissed; // Whether the call was missed

  Call({
    required this.name,
    required this.profileImage,
    required this.time,
    required this.callType,
    required this.isMissed,
  });

  static List<Call> calls = [
    Call(
      name: "Kristin Watson",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "Today, 14:30",
      callType: "Voice",
      isMissed: false,
    ),
    Call(
      name: "Cody Fisher",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "Today, 09:15",
      callType: "Video",
      isMissed: true,
    ),
    Call(
      name: "Darrell Steward",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "Yesterday, 19:20",
      callType: "Voice",
      isMissed: false,
    ),
    Call(
      name: "Kathryn Murphy",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "Yesterday, 13:45",
      callType: "Video",
      isMissed: true,
    ),
  ];
}
