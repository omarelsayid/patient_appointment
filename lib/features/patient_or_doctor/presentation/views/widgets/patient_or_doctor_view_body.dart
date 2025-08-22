import 'package:flutter/widgets.dart';
import 'package:patient_appointment/core/routes/pages_route.dart';
import 'package:patient_appointment/core/widgets/primary_elevated_button.dart';

class PatientOrDoctorViewBody extends StatelessWidget {
  const PatientOrDoctorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          PrimaryElevatedButton(text: "Patient", onTap: () {
            Navigator.pushReplacementNamed(context, PagesRoutes.appointmentBookingView);
          }),
          PrimaryElevatedButton(
            text: "Doctor",
            onTap: () {
              Navigator.pushReplacementNamed(context, PagesRoutes.homeView);
            },
          ),
        ],
      ),
    );
  }
}
