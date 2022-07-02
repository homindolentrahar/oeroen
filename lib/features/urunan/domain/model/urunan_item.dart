enum UrunanType { Keamanan, Kebersihan, Kas, Donasi }

class UrunanItem {
  final String id;
  final String desaId;
  final UrunanType type;
  final double amount;
  final DateTime timestamp;
  final bool completed;

  UrunanItem({
    required this.id,
    required this.desaId,
    required this.type,
    required this.amount,
    required this.timestamp,
    required this.completed,
  });
}
