
enum RollStatus { shooting, atLab, developed }

class FilmRoll {
  final String id;
  final String stock; // e.g. "Kodak Portra 400"
  final String format; // "35mm" / "120"
  final int totalFrames;
  final int shotFrames;
  final RollStatus status;
  final DateTime startedOn;
  final String camera;
  final String coverColor; // hex string, canister color per stock

  const FilmRoll({
    required this.id,
    required this.stock,
    required this.format,
    required this.totalFrames,
    required this.shotFrames,
    required this.status,
    required this.startedOn,
    required this.camera,
    required this.coverColor,
  });
}

class FrameEntry {
  final int number;
  final String aperture; // f/2.8
  final String shutter; // 1/125
  final int iso;
  final String note;
  final String location;

  const FrameEntry({
    required this.number,
    required this.aperture,
    required this.shutter,
    required this.iso,
    required this.note,
    required this.location,
  });
}

class JournalEntry {
  final String title;
  final String body;
  final DateTime date;
  final String rollId;

  const JournalEntry({
    required this.title,
    required this.body,
    required this.date,
    required this.rollId,
  });
}
