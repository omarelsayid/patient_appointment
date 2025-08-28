import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patient_appointment/features/patient/presentation/views/appointment_booking_view.dart';

Widget createTestWidget(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  group('AddAppointmentView Tests', () {
    testWidgets('renders all form fields', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(const AddAppointmentView()));

      expect(find.byType(TextFormField), findsNWidgets(2)); // name + age
      expect(find.text('Gender'), findsOneWidget);
      expect(find.text('Specialty'), findsOneWidget);
      expect(find.text('Save Appointment'), findsOneWidget);
    });

    testWidgets('shows error when submitting empty form',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(const AddAppointmentView()));

      await tester.tap(find.text('Save Appointment'));
      await tester.pump();

      // Validation messages
      expect(find.text('Name is required'), findsOneWidget);
      expect(find.text('Age is required'), findsOneWidget);
    });

    testWidgets('fills form and submits successfully',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(const AddAppointmentView()));

      // Fill name
      await tester.enterText(find.byType(TextFormField).at(0), 'Omar');
      // Fill age
      await tester.enterText(find.byType(TextFormField).at(1), '25');

      // Select gender
      await tester.tap(find.text('Gender'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();

      // Select specialty
      await tester.tap(find.text('Specialty'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(DropdownMenuItem<String>).first);
      await tester.pumpAndSettle();

      // Tap save
      await tester.tap(find.text('Save Appointment'));
      await tester.pump(); // trigger rebuild

      // ✅ Wait until snackbar is fully visible
      await tester.pumpAndSettle();

      // Verify SnackBar text
      expect(find.text("Appointment Added ✅"), findsOneWidget);
    });
  });
}
