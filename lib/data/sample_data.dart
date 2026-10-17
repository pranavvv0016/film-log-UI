import '../models/film_roll.dart';

final sampleRolls = <FilmRoll>[
  FilmRoll(
    id: 'r1',
    stock: 'Kodak Portra 400',
    format: '35mm',
    totalFrames: 36,
    shotFrames: 24,
    status: RollStatus.shooting,
    startedOn: DateTime(2026, 8, 12),
    camera: 'Pentax K1000',
    coverColor: '#A63D2F',
  ),
  FilmRoll(
    id: 'r2',
    stock: 'Ilford HP5 Plus',
    format: '35mm',
    totalFrames: 36,
    shotFrames: 36,
    status: RollStatus.atLab,
    startedOn: DateTime(2026, 7, 28),
    camera: 'Canon AE-1',
    coverColor: '#8A8270',
  ),
  FilmRoll(
    id: 'r3',
    stock: 'Fujifilm Fujicolor C200',
    format: '35mm',
    totalFrames: 24,
    shotFrames: 24,
    status: RollStatus.developed,
    startedOn: DateTime(2026, 7, 3),
    camera: 'Olympus Trip 35',
    coverColor: '#6E8368',
  ),
  FilmRoll(
    id: 'r4',
    stock: 'Kodak Tri-X 400',
    format: '120',
    totalFrames: 12,
    shotFrames: 5,
    status: RollStatus.shooting,
    startedOn: DateTime(2026, 8, 30),
    camera: 'Yashica Mat-124G',
    coverColor: '#BB8C3F',
  ),
];

final sampleFrames = <FrameEntry>[
  const FrameEntry(number: 1, aperture: 'f/2.8', shutter: '1/125', iso: 400, note: 'Morning light, kitchen window', location: 'Home'),
  const FrameEntry(number: 2, aperture: 'f/5.6', shutter: '1/250', iso: 400, note: 'Market stall, backlit', location: 'Jubilee Hills'),
  const FrameEntry(number: 3, aperture: 'f/4', shutter: '1/125', iso: 400, note: 'Portrait, open shade', location: 'Park'),
  const FrameEntry(number: 4, aperture: 'f/8', shutter: '1/500', iso: 400, note: 'Street, harsh noon sun', location: 'Old City'),
  const FrameEntry(number: 5, aperture: 'f/2.8', shutter: '1/60', iso: 400, note: 'Low light, handheld — might blur', location: 'Cafe'),
];

final sampleJournal = <JournalEntry>[
  JournalEntry(
    title: 'First roll through the K1000',
    body: 'Picked up the Pentax from a repair shop last week. Light seals held up fine. Shot half the Portra roll at the market — metering by eye, mostly guessing.',
    date: DateTime(2026, 8, 14),
    rollId: 'r1',
  ),
  JournalEntry(
    title: 'Dropped HP5 at the lab',
    body: 'Finished the roll at the old city walk. Asked for a normal push — curious how the grain holds up given how dim some of these frames were.',
    date: DateTime(2026, 8, 2),
    rollId: 'r2',
  ),
];
