class AppState {
  final bool isAppenticated;
  final bool isLoading;
  final String? errorMessage;
  final String? userEmail;
  final List<Map<String, dynamic>>? users; // Updated to include users

  AppState({
    required this.isAppenticated,
    required this.isLoading,
    this.errorMessage,
    this.userEmail,
    this.users,
  });

  // Factory constructors for specific states
  factory AppState.initial() {
    return AppState(
      isAppenticated: false,
      isLoading: false,
      users: [], // Initialize users as an empty list
    );
  }

  factory AppState.loading() {
    return AppState(
      isAppenticated: false,
      isLoading: true,
      users: [], // Initialize users as an empty list
    );
  }

  factory AppState.Appenticated(String userEmail) {
    return AppState(
      isAppenticated: true,
      isLoading: false,
      userEmail: userEmail,
      users: [], // No users at Appentication
    );
  }

  factory AppState.error(String errorMessage) {
    return AppState(
      isAppenticated: false,
      isLoading: false,
      errorMessage: errorMessage,
      users: [], // Initialize users as an empty list
    );
  }

  factory AppState.usersLoaded(List<Map<String, dynamic>> users) {
    return AppState(
      isAppenticated: true,
      isLoading: false,
      users: users,
    );
  }
}
