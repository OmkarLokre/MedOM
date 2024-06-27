import 'package:online_doctor_booking/consts/consts.dart';

class Category {
  String name;
  String url;

  Category(this.name, this.url);
}

class Labs {
  String name;
  String url;
  String title1;
  String desc1;
  String title2;
  String desc2;
  String category;
  int price;

  Labs(this.name, this.url, this.title1, this.desc1, this.title2, this.desc2,
      this.category, this.price);
}

final List<Category> categoryList = [
  Category("Kidney", "assets/images/kidney.png"),
  Category("Heart", "assets/images/heart.png"),
  Category("Lungs", "assets/images/lungs.png"),
  Category("Ear", "assets/images/listen.png"),
  Category("Liver", "assets/images/liver.png"),
  Category("Body", "assets/images/body.png")
];

var settings_list = [
  "Change Password",
  "Terms and Conditions",
  "About us",
  "Sign Out"
];

var settings_icon_list = [
  Icon(Icons.password_outlined),
  Icon(Icons.dashboard_customize_outlined),
  Icon(Icons.book_online_outlined),
  Icon(Icons.person)
];

List<Labs> LabList = [
  Labs(
      "Kidney",
      "assets/images/kidney.png",
      "Renal Function Panel",
      "The renal function panel is a blood test that assesses kidney function. It measures levels of substances such as creatinine, blood urea nitrogen (BUN), and electrolytes like sodium and potassium. This test helps diagnose and monitor kidney diseases, assess the effectiveness of treatments, and determine if the kidneys are filtering waste effectively.",
      "Urinalysis",
      "Urinalysis is a test of the urine that involves a series of chemical, microscopic, and visual examinations. It can detect a wide range of disorders, such as urinary tract infections, kidney disease, and diabetes. The test looks for abnormalities in the appearance, concentration, and content of urine.",
      "Kidney",
      500),
  Labs(
      "Heart",
      "assets/images/heart.png",
      "Electrocardiogram (ECG)",
      "An electrocardiogram (ECG) records the electrical activity of the heart. It is a simple, non-invasive test used to diagnose various heart conditions, such as arrhythmias, heart attacks, and other cardiac abnormalities. Electrodes are placed on the chest, arms, and legs, which detect the electrical signals of the heart and produce a graph on a monitor or paper.",
      "Echocardiogram",
      "An echocardiogram uses sound waves (ultrasound) to produce images of the heart. It provides detailed information about the heart's structure and function, including the size and shape of the heart, the condition of the heart chambers and valves, and the efficiency of the heart's pumping action.",
      "Heart",
      1200),
  Labs(
      "Lungs",
      "assets/images/lungs.png",
      "Pulmonary Function Test (PFT)",
      "Pulmonary function tests measure how well the lungs are working. These tests include spirometry, which measures how much air you can breathe in and out, and how fast you can exhale. PFTs help diagnose respiratory conditions such as asthma, chronic obstructive pulmonary disease (COPD), and other lung disorders.",
      "Chest X-Ray",
      "A chest X-ray is an imaging test that uses X-rays to view the structures inside the chest, including the heart, lungs, and bones. It can help diagnose conditions such as pneumonia, lung cancer, tuberculosis, and other lung diseases.",
      "Lungs",
      700),
  Labs(
      "Ear",
      "assets/images/listen.png",
      "Audiometry",
      "Audiometry tests evaluate a person's ability to hear sounds. During the test, the patient wears headphones and responds to various tones, pitches, and volumes. This test helps diagnose hearing loss and determine the severity and type of hearing impairment.",
      "Tympanometry",
      "Tympanometry is a test that evaluates the condition of the middle ear and the mobility of the eardrum. It involves creating variations of air pressure in the ear canal. This test helps diagnose conditions like fluid in the middle ear, ear infections, and eustachian tube dysfunction.",
      "Ear",
      600),
  Labs(
      "Liver",
      "assets/images/liver.png",
      "Liver Function Tests (LFTs)",
      "Liver function tests are a group of blood tests that provide information about the state of a patient's liver. These tests measure the levels of various enzymes, proteins, and substances produced or processed by the liver, including alanine transaminase (ALT), aspartate transaminase (AST), bilirubin, and albumin. Abnormal levels can indicate liver damage or disease.",
      "Hepatitis Panel",
      "A hepatitis panel is a blood test used to detect current or past infections with hepatitis viruses (A, B, C). It helps determine if a person has an acute or chronic infection, and which specific virus is causing the hepatitis.",
      "Liver",
      1000),
  Labs(
      "Body",
      "assets/images/body.png",
      "Complete Blood Count (CBC)",
      "A complete blood count (CBC) is a blood test used to evaluate overall health and detect a wide range of disorders, including anemia, infection, and leukemia. The test measures several components of the blood, including red blood cells, white blood cells, hemoglobin, hematocrit, and platelets.",
      "Comprehensive Metabolic Panel (CMP)",
      "A comprehensive metabolic panel (CMP) is a group of blood tests that provide information about the body's chemical balance and metabolism. It includes tests for blood sugar (glucose) levels, electrolyte and fluid balance, kidney function, and liver function.",
      "Body",
      400),
  Labs(
      "Blood",
      "assets/images/bl00f.png",
      "Blood Culture",
      "A blood culture test is performed to detect the presence of bacteria or fungi in the blood. This test helps diagnose infections that can spread through the bloodstream, such as bacteremia or septicemia, and determines the appropriate treatment.",
      "Coagulation Panel",
      "A coagulation panel assesses the blood's ability to clot and how long it takes to clot. Tests included in this panel are prothrombin time (PT), activated partial thromboplastin time (aPTT), and fibrinogen level. This panel helps diagnose bleeding disorders and monitor patients on anticoagulant therapy.",
      "Blood",
      250),
  Labs(
      "Thyroid",
      "assets/images/thyroidf.webp",
      "Thyroid Function Tests (TFTs)",
      "Thyroid function tests are a series of blood tests used to measure how well the thyroid gland is working. These tests include Thyroid Stimulating Hormone (TSH), T3, and T4 levels. Abnormal levels can indicate hypothyroidism or hyperthyroidism and help in the management of thyroid disorders.",
      "Thyroid Ultrasound",
      "A thyroid ultrasound uses sound waves to produce images of the thyroid gland. It helps detect nodules, cysts, and other abnormalities in the thyroid. This test is non-invasive and helps guide fine-needle aspiration biopsies.",
      "Thyroid",
      900),
  Labs(
      "Metabolic",
      "assets/images/metablic.png",
      "Lipid Profile",
      "A lipid profile is a blood test that measures the levels of specific fats in the blood, including cholesterol and triglycerides. It includes measurements of total cholesterol, HDL (high-density lipoprotein), LDL (low-density lipoprotein), and triglycerides. This test helps assess the risk of cardiovascular disease.",
      "Glucose Tolerance Test (GTT)",
      "A glucose tolerance test measures the body's response to sugar (glucose). It involves fasting overnight, drinking a sugary solution, and having blood sugar levels tested at intervals. This test helps diagnose diabetes and gestational diabetes.",
      "Metabolic",
      300)
];
