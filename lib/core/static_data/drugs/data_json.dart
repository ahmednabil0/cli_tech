import 'package:animated_custom_dropdown/custom_dropdown.dart';

class DrugModel with CustomDropdownListFilter {
  String name;
  String type;
  String category;

  DrugModel({required this.name, required this.type, required this.category});
  @override
  String toString() {
    return '$name - $type';
  }

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}

List<DrugModel> drugList = [
  DrugModel(name: "Acetaminophen", type: "Tablet", category: "Pain Relief"),
  DrugModel(name: "Ibuprofen", type: "Capsule", category: "Pain Relief"),
  DrugModel(name: "Aspirin", type: "Tablet", category: "Pain Relief"),
  DrugModel(name: "Loratadine", type: "Tablet", category: "Antihistamine"),
  DrugModel(name: "Amoxicillin", type: "Capsule", category: "Antibiotic"),
  DrugModel(name: "Ciprofloxacin", type: "Tablet", category: "Antibiotic"),
  DrugModel(name: "Omeprazole", type: "Capsule", category: "Gastrointestinal"),
  DrugModel(name: "Metformin", type: "Tablet", category: "Diabetes"),
  DrugModel(name: "Atorvastatin", type: "Tablet", category: "Cholesterol"),
  DrugModel(name: "Alprazolam", type: "Tablet", category: "Anxiety"),
  DrugModel(name: "Escitalopram", type: "Tablet", category: "Antidepressant"),
  DrugModel(name: "Warfarin", type: "Tablet", category: "Blood Thinner"),
  DrugModel(name: "Losartan", type: "Tablet", category: "Hypertension"),
  DrugModel(name: "Amlodipine", type: "Tablet", category: "Hypertension"),
  DrugModel(name: "Sertraline", type: "Tablet", category: "Antidepressant"),
  DrugModel(name: "Hydrochlorothiazide", type: "Tablet", category: "Diuretic"),
  DrugModel(name: "Lisinopril", type: "Tablet", category: "Hypertension"),
  DrugModel(name: "Levothyroxine", type: "Tablet", category: "Thyroid"),
  DrugModel(name: "Simvastatin", type: "Tablet", category: "Cholesterol"),
  DrugModel(name: "Meloxicam", type: "Tablet", category: "Pain Relief"),
  DrugModel(name: "Citalopram", type: "Tablet", category: "Antidepressant"),
  DrugModel(name: "Gabapentin", type: "Capsule", category: "Neuropathic Pain"),
  DrugModel(name: "Tramadol", type: "Tablet", category: "Pain Relief"),
  DrugModel(name: "Metoprolol", type: "Tablet", category: "Hypertension"),
  DrugModel(name: "Prednisone", type: "Tablet", category: "Corticosteroid"),
  DrugModel(name: "Fluoxetine", type: "Capsule", category: "Antidepressant"),
  DrugModel(name: "Trazodone", type: "Tablet", category: "Antidepressant"),
  DrugModel(name: "Diazepam", type: "Tablet", category: "Anxiety"),
  DrugModel(name: "Amphetamine", type: "Tablet", category: "ADHD"),
  DrugModel(name: "Methylphenidate", type: "Tablet", category: "ADHD"),
  DrugModel(name: "Duloxetine", type: "Capsule", category: "Antidepressant"),
  DrugModel(name: "Bupropion", type: "Tablet", category: "Antidepressant"),
  DrugModel(name: "Ranitidine", type: "Tablet", category: "Gastrointestinal"),
  DrugModel(name: "Pantoprazole", type: "Tablet", category: "Gastrointestinal"),
  DrugModel(name: "Carvedilol", type: "Tablet", category: "Hypertension"),
  DrugModel(name: "Montelukast", type: "Tablet", category: "Asthma"),
  DrugModel(name: "Aripiprazole", type: "Tablet", category: "Antipsychotic"),
  DrugModel(name: "Quetiapine", type: "Tablet", category: "Antipsychotic"),
  DrugModel(name: "Clonazepam", type: "Tablet", category: "Antipsychotic"),
  DrugModel(name: "Clonidine", type: "Tablet", category: "Antipsychotic"),
  DrugModel(name: "Naloxone", type: "Tablet", category: "Antipsychotic"),
  DrugModel(name: "Loratadine", type: "Tablet", category: "Antipsychotic"),
  DrugModel(name: "Doxycycline", type: "Tablet", category: "Antipsychotic"),
  DrugModel(name: "Cyclobenzaprine", type: "Tablet", category: "Antipsychotic"),
  DrugModel(name: "Cymbalta", type: "Tablet", category: "Antipsychotic"),
];
