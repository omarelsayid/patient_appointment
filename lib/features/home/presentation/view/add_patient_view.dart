import 'package:flutter/material.dart';
import 'package:patient_appointment/features/home/presentation/view_model/patient_provider.dart';
import 'package:provider/provider.dart';
import 'package:patient_appointment/features/home/domain/entities/patien_entity.dart';

class AddPatientView extends StatefulWidget {
  const AddPatientView({super.key});

  @override
  State<AddPatientView> createState() => _AddPatientViewState();
}

class _AddPatientViewState extends State<AddPatientView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? _selectedGender;
  DateTime? _appointmentTime;

  Future<void> _pickDateTime(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;

    setState(() {
      _appointmentTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  void _savePatient() {
    if (_formKey.currentState!.validate() && _appointmentTime != null) {
      final patient = PatientEntity(
        name: _nameController.text.trim(),
        age: int.parse(_ageController.text.trim()),
        gender: _selectedGender!, // from dropdown
        appointmentTime: _appointmentTime!,
        imageUrl: '',
      );

      context.read<PatientProvider>().addPatient(patient);
      Navigator.pop(context); // back to list
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Patient")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Name required" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Age"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Age required";
                  if (int.tryParse(val) == null) return "Enter valid number";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Gender dropdown
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(labelText: "Gender"),
                items: const [
                  DropdownMenuItem(value: "Male", child: Text("Male")),
                  DropdownMenuItem(value: "Female", child: Text("Female")),
                  DropdownMenuItem(value: "Other", child: Text("Other")),
                ],
                onChanged: (val) {
                  setState(() {
                    _selectedGender = val;
                  });
                },
                validator: (val) =>
                    val == null || val.isEmpty ? "Please select gender" : null,
              ),

              const SizedBox(height: 12),
              ListTile(
                title: Text(
                  _appointmentTime == null
                      ? "Pick Appointment Date & Time"
                      : "Appointment: ${_appointmentTime!.toLocal()}",
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _pickDateTime(context),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _savePatient,
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
