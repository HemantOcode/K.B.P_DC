class AcadmicModal {
  final String name;
  final String shortForm;
  final String description;
  final String eligibility;
  final String objective;
  final String image;

  final String totalIntake;
  final List semesters;

  AcadmicModal(
      {required this.description,
      required this.eligibility,
      required this.name,
      required this.objective,
      required this.semesters,
      required this.shortForm,
      required this.image,
      required this.totalIntake});
}
