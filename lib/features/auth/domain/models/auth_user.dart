class AuthUser {
  final String? userId;
  final String? email;
  final String? displayName;
  final String? phoneNumber;
  final String? providerId;
  final DateTime? createdAt;
  final DateTime? lastSignedInAt;
  final bool isVerified;
  final String? role;

  AuthUser({
    this.userId,
    this.email,
    this.displayName,
    this.phoneNumber,
    this.providerId,
    this.createdAt,
    this.lastSignedInAt,
    this.isVerified = false,
    this.role,
  });
}
