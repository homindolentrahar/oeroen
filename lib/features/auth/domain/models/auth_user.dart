class AuthUser {
  final String userId;
  final String email;
  final String displayName;
  final String phoneNumber;
  final String providerId;
  final DateTime createdAt;
  final DateTime lastSignedInAt;
  final bool isVerified;

  AuthUser({
    required this.userId,
    required this.email,
    required this.displayName,
    required this.phoneNumber,
    required this.providerId,
    required this.createdAt,
    required this.lastSignedInAt,
    required this.isVerified,
  });
}
