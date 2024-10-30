class Status {
  final String name; // User's name
  final String profileImage; // URL or asset path to the profile picture
  final String time; // Time of the status update (e.g., "12 minutes ago")
  final String
      category; // Category of the status (e.g., "Recent", "Viewed", "Muted")

  Status({
    required this.name,
    required this.profileImage,
    required this.time,
    required this.category,
  });

  static List<Status> statuses = [
    Status(
      name: "Kristin Watson",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "12 minutes ago",
      category: "Recent",
    ),
    Status(
      name: "Cody Fisher",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "Today, 18:26",
      category: "Recent",
    ),
    Status(
      name: "Darrell Steward",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "Today, 14:48",
      category: "Viewed",
    ),
    Status(
      name: "Kathryn Murphy",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "Today, 13:27",
      category: "Viewed",
    ),
    Status(
      name: "Darlene Robertson",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "Today, 09:45",
      category: "Muted",
    ),
    Status(
      name: "Theresa Webb",
      profileImage: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png",
      time: "Yesterday, 23:47",
      category: "Muted",
    ),
  ];
}
