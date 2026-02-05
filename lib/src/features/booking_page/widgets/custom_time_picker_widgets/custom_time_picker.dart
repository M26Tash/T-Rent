import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalTimePicker extends StatelessWidget {
  final DateTime selectedDate;
  final TimeOfDay? selectedTime;
  final ValueChanged<TimeOfDay> onChanged;

  const VerticalTimePicker({
    required this.selectedDate,
    required this.selectedTime,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final slots = generateTimeSlots(selectedDate: selectedDate);

    if (slots.isEmpty) {
      return const Center(
        child: Text(
          'No available time',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    final initialIndex = selectedTime == null
        ? 0
        : slots.indexWhere((t) =>
            t.hour == selectedTime!.hour && t.minute == selectedTime!.minute,);

    return SizedBox(
      height: 200,
      child: CupertinoPicker(
        itemExtent: 44,
        scrollController: FixedExtentScrollController(
          initialItem: initialIndex >= 0 ? initialIndex : 0,
        ),
        onSelectedItemChanged: (index) {
          onChanged(slots[index]);
        },
        children: slots.map(_buildItem).toList(),
      ),
    );
  }

  Widget _buildItem(TimeOfDay time) {
    final h = time.hour.toString().padLeft(2, '0');
    final m = time.minute.toString().padLeft(2, '0');

    return Center(
      child: Text(
        '$h:$m',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

List<TimeOfDay> generateTimeSlots({
  required DateTime selectedDate,
  DateTime? now,
}) {
  now ??= DateTime.now();

  final slots = <TimeOfDay>[];

  final isToday = selectedDate.year == now.year &&
      selectedDate.month == now.month &&
      selectedDate.day == now.day;

  const interval = 30; // minutes
  const lastSlotMinutes = 23 * 60 + 30; // 23:30

  var startMinutes = 0;

  if (isToday) {
    final currentMinutes = now.hour * 60 + now.minute;

    // ⬆ Round UP to next 30-min slot
    startMinutes = ((currentMinutes + interval - 1) ~/ interval) * interval;

    // ⛔ All slots passed
    if (startMinutes > lastSlotMinutes) {
      return [];
    }
  }

  for (var minutes = startMinutes;
      minutes <= lastSlotMinutes;
      minutes += interval) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;

    slots.add(TimeOfDay(hour: hour, minute: minute));
  }

  return slots;
}
