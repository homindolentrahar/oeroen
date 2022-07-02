import 'package:oeroen/features/urunan/domain/model/urunan_item.dart';

final List<UrunanItem> activeUrunan = [
  UrunanItem(
    id: "378c2c2b-71d7-451d-b049-f90c73956602",
    desaId: "desa1",
    type: UrunanType.Keamanan,
    amount: 25000,
    timestamp: DateTime.now(),
    completed: false,
  ),
  UrunanItem(
    id: "62de2b88-c8e6-4b83-a572-0cbec995d1e5",
    desaId: "desa1",
    type: UrunanType.Kebersihan,
    amount: 18000,
    timestamp: DateTime.now(),
    completed: false,
  ),
  UrunanItem(
    id: "a88df718-5c0c-4a5d-ac99-d721aef29622",
    desaId: "desa1",
    type: UrunanType.Donasi,
    amount: 50000,
    timestamp: DateTime.now(),
    completed: false,
  ),
  UrunanItem(
    id: "dd605891-9847-4a18-90a3-7fb874e2e3b5",
    desaId: "desa1",
    type: UrunanType.Kas,
    amount: 10000,
    timestamp: DateTime.now(),
    completed: false,
  ),
];
