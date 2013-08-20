templateclicker(level1, level2 = 0,level3 = 0,level4 = 0,level5 = 0,level6 = 0)
{
	focusonfirsttemplate()
	CoordMode, mouse, screen
	WinGetPos, originx, originy,,,A
	templaterelativeclicker(level1,60,originx,originy)
	templaterelativeclicker(level2,260,originx,originy)
	templaterelativeclicker(level3,460,originx,originy)
	templaterelativeclicker(level4,660,originx,originy)
	templaterelativeclicker(level5,860,originx,originy)
	templaterelativeclicker(level6,1060,originx,originy)
	CoordMode, mouse, relative
}

templaterelativeclicker(level,offset,originx,originy)
{
	if (level is between 0  and 6){
		If(level > 0) {
		clicky := originy + (level * 25) + 15
		clickx := originx + offset
		click, %clickx%, %clicky%
		WinWaitNotActive
		}
	}
}

rxmed(med)
{
templateclicker("15", "4", "2")
Sendinput %med%{Enter}{Escape}
WinWaitActive, Patient Chart
ImageSearch, FoundX, FoundY, 421, 152, 1040, 975, *n4 prescriptions.png
click, %FoundX%, %FoundY%
WinWaitActive, Medication List
SendInput !w%med%
}

focusonfirsttemplate()
{
CoordMode, Mouse, screen
click, 233, 34
CoordMode, Mouse, relative
}



; Plan Template Items from spreadsheet replace with \r\n (transform backslashes), remove the first else

performchoice(theinput) {
if theinput = ±  Urine Pregnancy Test
templateclicker("2", "3")
else if theinput = ±  Urinalysis
templateclicker("2", "5")
else if theinput = ±  Rapid Strep
templateclicker("2", "4")
else if theinput = ±  BMP
templateclicker("3", "3")
else if theinput = ±  BNP
templateclicker("3", "4")
else if theinput = ±  CMP
templateclicker("3", "5")
else if theinput = ±  CBC
templateclicker("3", "7")
else if theinput = ±  CBC
templateclicker("3", "7")
else if theinput = ±  CBC without Diff
templateclicker("3", "8")
else if theinput = ±  Strep Culture
templateclicker("3", "9", "1")
else if theinput = ±  Urine Culture
templateclicker("3", "9", "8")
else if theinput = ±  Fungal Culture (skin/hair)
templateclicker("3", "9", "3")
else if theinput = ±  Pertussis Swab
templateclicker("3", "9", "4")
else if theinput = ±  Stool Culture
templateclicker("3", "9", "6")
else if theinput = ±  Vaginal Culture
templateclicker("3", "9", "9")
else if theinput = ±  GBS Vaginal Culture
templateclicker("3", "9", "10")
else if theinput = ±  Wound Culture
templateclicker("3", "9", "12")
else if theinput = ±  ESR
templateclicker("3", "10")
else if theinput = ±  Glucose
templateclicker("3", "11")
else if theinput = ±  Quant. HCG
templateclicker("3", "12")
else if theinput = ±  Hepatic Function Panel
templateclicker("3", "13")
else if theinput = ±  Liver Function Panel
templateclicker("3", "13")
else if theinput = ±  A1C
templateclicker("3", "14")
else if theinput = ±  Lipid Panel
templateclicker("3", "15")
else if theinput = ±  Direct LDL
templateclicker("3", "16")
else if theinput = ±  Microalbumin/Cr Ratio
templateclicker("3", "17")
else if theinput = ±  INR
templateclicker("3", "19")
else if theinput = ±  Vitamin D
templateclicker("3", "21")
else if theinput = ±  D-Dimer
templateclicker("3", "2", "1", "13")
else if theinput = ±  Amylase
templateclicker("3", "2", "5", "1")
else if theinput = ±  Pap Smear
templateclicker("3", "2", "7", "1")
else if theinput = ±  HPV (High Risk)
templateclicker("3", "2", "7", "2")
else if theinput = ±  PKU
templateclicker("3", "2", "10", "3")
else if theinput = ±  Quad Screen
templateclicker("3", "2", "10", "4", "13")
else if theinput = ±  PSA (Total)
templateclicker("3", "18", "2")
else if theinput = ±  TSH
templateclicker("3", "20", "1")
else if theinput = ±  Free T3
templateclicker("3", "20", "2")
else if theinput = ±  Free T4
templateclicker("3", "20", "3")
else if theinput = ¬  Chest XR
templateclicker("4", "3", "1")
else if theinput = ¬  L-spine XR
templateclicker("4", "4", "3", "1")
else if theinput = ¬  C-spine XR
templateclicker("4", "4", "1", "1")
else if theinput = ¬  Fetal Survey
templateclicker("4", "19", "8")
else if theinput = ¬  AAA Screening
templateclicker("4", "19", "2", "1")
else if theinput = ¬  EKG
templateclicker("5", "2")
else if theinput = ¬  ECG
templateclicker("5", "2")
else if theinput = ¬  PFT
templateclicker("5", "5")
else if theinput = »  Cardiology
templateclicker("7", "1", "3")
else if theinput = »  Dermatology
templateclicker("7", "1", "5")
else if theinput = »  Endocrinology
templateclicker("7", "1", "6")
else if theinput = »  Otolaryngology
templateclicker("7", "1", "7")
else if theinput = »  Gastroenterology
templateclicker("7", "1", "8")
else if theinput = »  General Surgery
templateclicker("7", "1", "9")
else if theinput = »  Hematology
templateclicker("7", "1", "11")
else if theinput = »  Nephrology
templateclicker("7", "1", "14")
else if theinput = »  Neurology
templateclicker("7", "1", "15")
else if theinput = »  Neuro Surgery
templateclicker("7", "1", "16")
else if theinput = »  OB/Gyn
templateclicker("7", "1", "17")
else if theinput = »  Ophthalmology
templateclicker("7", "1", "18")
else if theinput = »  Orthopedics
templateclicker("7", "1", "20")
else if theinput = »  Podiatry
templateclicker("7", "1", "24")
else if theinput = »  Psychiatry
templateclicker("7", "1", "25")
else if theinput = »  Pulmonology
templateclicker("7", "1", "26")
else if theinput = »  Rheumatology
templateclicker("7", "1", "27")
else if theinput = »  Sleep
templateclicker("7", "1", "28")
else if theinput = »  Urology
templateclicker("7", "1", "29")
else if theinput = »  Audiology
templateclicker("7", "2", "2")
else if theinput = »  Chiropracter
templateclicker("7", "2", "3")
else if theinput = »  Diabetic Educator
templateclicker("7", "2", "4")
else if theinput = »  Home Health
templateclicker("7", "2", "5")
else if theinput = »  Hospice
templateclicker("7", "2", "6")
else if theinput = »  Massage
templateclicker("7", "2", "7")
else if theinput = »  Massage
templateclicker("7", "2", "7")
else if theinput = »  Physical Therapy
templateclicker("7", "2", "12")
else if theinput = »  Physical Therapy
templateclicker("7", "2", "12")
else if theinput = Ö  Patient Refused
templateclicker("8", "1")
else if theinput = Ö  Patient Refused
templateclicker("8", "1")
else if theinput = ™  OB visit until 28w
templateclicker("11", "2")
else if theinput = ™  OB visit 28-35w
templateclicker("11", "3")
else if theinput = ™  OB visit 36+w
templateclicker("11", "4")
else if theinput = ™  OB Postpartum Visit
templateclicker("11", "5")
else if theinput = ™  Time > 10min; 99212
templateclicker("20", "2")
else if theinput = ™  Time > 15min; 99213
templateclicker("20", "3")
else if theinput = ™  Time > 25min; 99214
templateclicker("20", "4")
else if theinput = ™  Time > 40min; 99215
templateclicker("20", "5")
else if theinput = î  New Medication
templateclicker("15", "4", "2")
else if theinput = î  No Change in Meds
templateclicker("15", "1")
else if theinput = î  Increase Medication Dose
templateclicker("15", "6", "2")
else if theinput = î  Decrease Medication Dose
templateclicker("15", "7", "2")
else if theinput = î  Discontinue Medication
templateclicker("15", "8", "2")
else if theinput = î  Hold Medication
templateclicker("15", "9", "2")
else if theinput = î  Resume Medication
templateclicker("15", "10", "2")
else if theinput = î  Electronic Prescription
templateclicker("16")
else if theinput = î  Discussed medication
templateclicker("18")
else if theinput = ¶  Natural History
templateclicker("17", "1")
else if theinput = ¶  Differential Diagnosis
templateclicker("17", "2")
else if theinput = ¶  OTC Meds
templateclicker("17", "3")
else if theinput = ¶  Reassuring Exam
templateclicker("17", "4")
else if theinput = ¶  Warning Signs (Red Flags)
templateclicker("17", "5")
else if theinput = ¶  URI Measures
templateclicker("17", "6")
else if theinput = ¶  Treatment Options
templateclicker("17", "7")
else if theinput = ¶  Another Topic
templateclicker("17", "8")
else if theinput = §  Follow up at future visit
templateclicker("19", "1")
else if theinput = ß  Follow up as needed (prn)
templateclicker("23", "6")
else if theinput = ß  Call 1 day
templateclicker("23", "2", "1", "1")
else if theinput = ß  Call 2 days
templateclicker("23", "2", "1", "2")
else if theinput = ß  Call 3 days
templateclicker("23", "2", "1", "3")
else if theinput = ß  Call 4 days
templateclicker("23", "2", "1", "4")
else if theinput = ß  Call 5 days
templateclicker("23", "2", "1", "5")
else if theinput = ß  Call 6 days
templateclicker("23", "2", "1", "6")
else if theinput = ß  Call 7 days
templateclicker("23", "2", "1", "7")
else if theinput = ß  Call 8 days
templateclicker("23", "2", "1", "8")
else if theinput = ß  Call 9 days
templateclicker("23", "2", "1", "9")
else if theinput = ß  Call 10 days
templateclicker("23", "2", "1", "10")
else if theinput = ß  Call 11 days
templateclicker("23", "2", "1", "11")
else if theinput = ß  Call 12 days
templateclicker("23", "2", "1", "12")
else if theinput = ß  Call 13 days
templateclicker("23", "2", "1", "13")
else if theinput = ß  Call 14 days
templateclicker("23", "2", "1", "14")
else if theinput = ß  Call 1 week
templateclicker("23", "2", "2", "1")
else if theinput = ß  Call 2 weeks
templateclicker("23", "2", "2", "2")
else if theinput = ß  Call 3 weeks
templateclicker("23", "2", "2", "3")
else if theinput = ß  Call 4 weeks
templateclicker("23", "2", "2", "4")
else if theinput = ß  Call 5 weeks
templateclicker("23", "2", "2", "5")
else if theinput = ß  Call 6 weeks
templateclicker("23", "2", "2", "6")
else if theinput = ß  Call 7 weeks
templateclicker("23", "2", "2", "7")
else if theinput = ß  Call 8 weeks
templateclicker("23", "2", "2", "8")
else if theinput = ß  Call 9 weeks
templateclicker("23", "2", "2", "9")
else if theinput = ß  Call 10 weeks
templateclicker("23", "2", "2", "10")
else if theinput = ß  Call 11 weeks
templateclicker("23", "2", "2", "11")
else if theinput = ß  Call 12 weeks
templateclicker("23", "2", "2", "12")
else if theinput = ß  Call 1 month
templateclicker("23", "2", "3", "1")
else if theinput = ß  Call 2 months
templateclicker("23", "2", "3", "2")
else if theinput = ß  Call 3 months
templateclicker("23", "2", "3", "3")
else if theinput = ß  Call 4 months
templateclicker("23", "2", "3", "4")
else if theinput = ß  Call 5 months
templateclicker("23", "2", "3", "5")
else if theinput = ß  Call 6 months
templateclicker("23", "2", "3", "6")
else if theinput = ß  Call 7 months
templateclicker("23", "2", "3", "7")
else if theinput = ß  Call 8 months
templateclicker("23", "2", "3", "8")
else if theinput = ß  Call 9 months
templateclicker("23", "2", "3", "9")
else if theinput = ß  Call 10 months
templateclicker("23", "2", "3", "10")
else if theinput = ß  Call 11 months
templateclicker("23", "2", "3", "11")
else if theinput = ß  Call 12 months
templateclicker("23", "2", "3", "12")
else if theinput = §  Appointment 1 day
templateclicker("23", "7", "1")
else if theinput = §  Appointment 2 days
templateclicker("23", "7", "2")
else if theinput = §  Appointment 3 days
templateclicker("23", "7", "3")
else if theinput = §  Appointment 4 days
templateclicker("23", "7", "4")
else if theinput = §  Appointment 5 days
templateclicker("23", "7", "5")
else if theinput = §  Appointment 6 days
templateclicker("23", "7", "6")
else if theinput = §  Appointment 7 days
templateclicker("23", "7", "7")
else if theinput = §  Appointment 8 days
templateclicker("23", "7", "8")
else if theinput = §  Appointment 9 days
templateclicker("23", "7", "9")
else if theinput = §  Appointment 10 days
templateclicker("23", "7", "10")
else if theinput = §  Appointment 11 days
templateclicker("23", "7", "11")
else if theinput = §  Appointment 12 days
templateclicker("23", "7", "12")
else if theinput = §  Appointment 13 days
templateclicker("23", "7", "13")
else if theinput = §  Appointment 14 days
templateclicker("23", "7", "14")
else if theinput = §  Appointment 1 week
templateclicker("23", "8", "1")
else if theinput = §  Appointment 2 weeks
templateclicker("23", "8", "2")
else if theinput = §  Appointment 3 weeks
templateclicker("23", "8", "3")
else if theinput = §  Appointment 4 weeks
templateclicker("23", "8", "4")
else if theinput = §  Appointment 5 weeks
templateclicker("23", "8", "5")
else if theinput = §  Appointment 6 weeks
templateclicker("23", "8", "6")
else if theinput = §  Appointment 7 weeks
templateclicker("23", "8", "7")
else if theinput = §  Appointment 8 weeks
templateclicker("23", "8", "8")
else if theinput = §  Appointment 9 weeks
templateclicker("23", "8", "9")
else if theinput = §  Appointment 10 weeks
templateclicker("23", "8", "10")
else if theinput = §  Appointment 11 weeks
templateclicker("23", "8", "11")
else if theinput = §  Appointment 12 weeks
templateclicker("23", "8", "12")
else if theinput = §  Appointment 1 month
templateclicker("23", "9", "1")
else if theinput = §  Appointment 2 months
templateclicker("23", "9", "2")
else if theinput = §  Appointment 3 months
templateclicker("23", "9", "3")
else if theinput = §  Appointment 4 months
templateclicker("23", "9", "4")
else if theinput = §  Appointment 5 months
templateclicker("23", "9", "5")
else if theinput = §  Appointment 6 months
templateclicker("23", "9", "6")
else if theinput = §  Appointment 7 months
templateclicker("23", "9", "7")
else if theinput = §  Appointment 8 months
templateclicker("23", "9", "8")
else if theinput = §  Appointment 9 months
templateclicker("23", "9", "9")
else if theinput = §  Appointment 10 months
templateclicker("23", "9", "10")
else if theinput = §  Appointment 11 months
templateclicker("23", "9", "11")
else if theinput = §  Appointment 12 months
templateclicker("23", "9", "12")
else if theinput = §  Appointment 1 year
templateclicker("23", "9", "12")
else if theinput = §  Depending on Lab/Test Results
templateclicker("23", "15")
else if theinput = §  Schedule CPE
templateclicker("23", "10")

; ---------------------------------------------- Medication Autocomplete
else if theinput = ° Percocet
rxmed("Percocet")
else if theinput = ° Vicodin
rxmed("Vicodin")
else if theinput = ° Methadone
rxmed("Methadone")
else if theinput = ° Simvastatin
rxmed("Simvastatin")
else if theinput = ° Clonazepam
rxmed("Clonazepam")
else if theinput = ° Lisinopril
rxmed("Lisinopril")
else if theinput = ° Meloxicam
rxmed("Meloxicam")
else if theinput = ° Flonase
rxmed("Flonase")
else if theinput = ° Lisinopril/Hydrochlorothiazide
rxmed("Lisinopril/Hydrochlorothiazide")
else if theinput = ° Atenolol
rxmed("Atenolol")
else if theinput = ° Metformin
rxmed("Metformin")
else if theinput = ° Fluoxetine
rxmed("Fluoxetine")
else if theinput = ° Hydrocodone/Acetaminophen
rxmed("Hydrocodone/Acetaminophen")
else if theinput = ° Hydrochlorothiazide (HCTZ)
rxmed("Hydrochlorothiazide (HCTZ)")
else if theinput = ° Amoxicillin
rxmed("Amoxicillin")
else if theinput = ° Lorazepam
rxmed("Lorazepam")
else if theinput = ° Omeprazole
rxmed("Omeprazole")
else if theinput = ° Zolpidem
rxmed("Zolpidem")
else if theinput = ° Adderall XR
rxmed("Adderall XR")
else if theinput = ° Levothyroxine
rxmed("Levothyroxine")
else if theinput = ° Zoloft
rxmed("Zoloft")
else if theinput = ° Lovastatin
rxmed("Lovastatin")
else if theinput = ° Citalopram
rxmed("Citalopram")
else if theinput = ° Albuterol HFA
rxmed("Albuterol HFA")
else if theinput = ° Ambien
rxmed("Ambien")
else if theinput = ° Codeine/Guaifenesin
rxmed("Codeine/Guaifenesin")
else if theinput = ° Prednisone
rxmed("Prednisone")
else if theinput = ° Celexa
rxmed("Celexa")
else if theinput = ° Metoprolol
rxmed("Metoprolol")
else if theinput = ° Triamcinolone
rxmed("Triamcinolone")
else if theinput = ° Azithromycin
rxmed("Azithromycin")
else if theinput = ° Atenolol/Chlorthalidone
rxmed("Atenolol/Chlorthalidone")
else if theinput = ° Trazodone
rxmed("Trazodone")
else if theinput = ° Zofran
rxmed("Zofran")
else if theinput = ° MS Contin
rxmed("MS Contin")
else if theinput = ° Cyclobenzaprine HCl
rxmed("Cyclobenzaprine HCl")
else if theinput = ° Bactrim DS
rxmed("Bactrim DS")
else if theinput = ° Amitriptyline HCl
rxmed("Amitriptyline HCl")
else if theinput = ° Viagra
rxmed("Viagra")
else if theinput = ° Cialis
rxmed("Cialis")
else if theinput = ° Synthroid
rxmed("Synthroid")
else if theinput = ° Potassium Chloride
rxmed("Potassium Chloride")
else if theinput = ° Tylenol w/Codeine #3
rxmed("Tylenol w/Codeine #3")
else if theinput = ° Alprazolam
rxmed("Alprazolam")
else if theinput = ° Dilaudid
rxmed("Dilaudid")
else if theinput = ° Lipitor
rxmed("Lipitor")
else if theinput = ° Glyburide
rxmed("Glyburide")
else if theinput = ° Adderall
rxmed("Adderall")
else if theinput = ° Keflex
rxmed("Keflex")
else if theinput = ° Flexeril
rxmed("Flexeril")
else if theinput = ° Ciprofloxacin HCl
rxmed("Ciprofloxacin HCl")
else if theinput = ° Gabapentin
rxmed("Gabapentin")
else if theinput = ° Sertraline HCl
rxmed("Sertraline HCl")
else if theinput = ° Aerochamber
rxmed("Aerochamber")
else if theinput = ° Venlafaxine HCl
rxmed("Venlafaxine HCl")
else if theinput = ° Effexor XR
rxmed("Effexor XR")
else if theinput = ° Flomax
rxmed("Flomax")
else if theinput = ° Oxycontin
rxmed("Oxycontin")
else if theinput = ° Wellbutrin XL
rxmed("Wellbutrin XL")
else if theinput = ° Terbinafine HCl
rxmed("Terbinafine HCl")
else if theinput = ° Test strips
rxmed("Test strips")
else if theinput = ° Glipizide
rxmed("Glipizide")
else if theinput = ° Cipro
rxmed("Cipro")
else if theinput = ° Amlodipine
rxmed("Amlodipine")
else if theinput = ° Prilosec
rxmed("Prilosec")
else if theinput = ° Acyclovir
rxmed("Acyclovir")
else if theinput = ° Flovent HFA
rxmed("Flovent HFA")
else if theinput = ° Furosemide
rxmed("Furosemide")
else if theinput = ° Imitrex
rxmed("Imitrex")
else if theinput = ° Cozaar
rxmed("Cozaar")
else if theinput = ° Pravastatin
rxmed("Pravastatin")
else if theinput = ° Allopurinol
rxmed("Allopurinol")
else if theinput = ° Doxazosin Mesylate
rxmed("Doxazosin Mesylate")
else if theinput = ° Prozac
rxmed("Prozac")
else if theinput = ° Clobetasol Propionate
rxmed("Clobetasol Propionate")
else if theinput = ° Xanax
rxmed("Xanax")
else if theinput = ° Mirapex
rxmed("Mirapex")
else if theinput = ° Coumadin
rxmed("Coumadin")
else if theinput = ° Vitamin D2
rxmed("Vitamin D2")
else if theinput = ° Nystatin
rxmed("Nystatin")
else if theinput = ° Albuterol
rxmed("Albuterol")
else if theinput = ° Lantus
rxmed("Lantus")
else if theinput = ° Plavix
rxmed("Plavix")
else if theinput = ° Tylenol w/Codeine #4
rxmed("Tylenol w/Codeine #4")
else if theinput = ° Protonix
rxmed("Protonix")
else if theinput = ° Chantix
rxmed("Chantix")
else if theinput = ° Levoxyl
rxmed("Levoxyl")
else if theinput = ° Morphine Sulfate
rxmed("Morphine Sulfate")
else if theinput = ° Ritalin SR
rxmed("Ritalin SR")
else if theinput = ° Paxil
rxmed("Paxil")
else if theinput = ° Endocet
rxmed("Endocet")
else if theinput = ° Tramadol
rxmed("Tramadol")
else if theinput = ° Dicyclomine HCl
rxmed("Dicyclomine HCl")
else if theinput = ° Metronidazole
rxmed("Metronidazole")
else if theinput = ° Physical Therapy
rxmed("Physical Therapy")
else if theinput = ° Phenergan
rxmed("Phenergan")
else if theinput = ° Effexor
rxmed("Effexor")
else if theinput = ° Fluoritab
rxmed("Fluoritab")
else if theinput = ° Premarin
rxmed("Premarin")
else if theinput = ° Acetaminophen/Codeine
rxmed("Acetaminophen/Codeine")
else if theinput = ° Lasix
rxmed("Lasix")
else if theinput = ° Oxycodone/Acetaminophen
rxmed("Oxycodone/Acetaminophen")
else if theinput = ° Ranitidine
rxmed("Ranitidine")
else if theinput = ° Tessalon Perles
rxmed("Tessalon Perles")
else if theinput = ° Propranolol HCl
rxmed("Propranolol HCl")
else if theinput = ° Advair Diskus
rxmed("Advair Diskus")
else if theinput = ° Losartan
rxmed("Losartan")
else if theinput = ° Nortriptyline
rxmed("Nortriptyline")
else if theinput = ° Spironolactone
rxmed("Spironolactone")
else if theinput = ° Benzamycin
rxmed("Benzamycin")
else if theinput = ° Fioricet
rxmed("Fioricet")
else if theinput = ° QVAR
rxmed("QVAR")
else if theinput = ° Bupropion ER (SR)
rxmed("Bupropion ER (SR)")
else if theinput = ° Maxzide
rxmed("Maxzide")
else if theinput = ° Wellbutrin SR
rxmed("Wellbutrin SR")
else if theinput = ° Augmentin
rxmed("Augmentin")
else if theinput = ° Benazepril HCl
rxmed("Benazepril HCl")
else if theinput = ° Crestor
rxmed("Crestor")
else if theinput = ° Diltiazem HCl
rxmed("Diltiazem HCl")
else if theinput = ° Estradiol
rxmed("Estradiol")
else if theinput = ° Naproxen
rxmed("Naproxen")
else if theinput = ° Fluticasone Propionate
rxmed("Fluticasone Propionate")
else if theinput = ° Indomethacin
rxmed("Indomethacin")
else if theinput = ° Oxycodone HCl
rxmed("Oxycodone HCl")
else if theinput = ° Permethrin
rxmed("Permethrin")
else if theinput = ° Doxepin HCl
rxmed("Doxepin HCl")
else if theinput = ° Levitra
rxmed("Levitra")
else if theinput = ° Losartan/Hydrochlorothiazide
rxmed("Losartan/Hydrochlorothiazide")
else if theinput = ° Pantoprazole
rxmed("Pantoprazole")
else if theinput = ° Ritalin LA
rxmed("Ritalin LA")
else if theinput = ° Ativan
rxmed("Ativan")
else if theinput = ° Erythromycin Ophthalmic
rxmed("Erythromycin Ophthalmic")
else if theinput = ° TobraDex
rxmed("TobraDex")
else if theinput = ° Diflucan
rxmed("Diflucan")
else if theinput = ° Minocycline HCl
rxmed("Minocycline HCl")
else if theinput = ° Ritalin
rxmed("Ritalin")
else if theinput = ° Triamterene/Hydrochlorothiazide
rxmed("Triamterene/Hydrochlorothiazide")
else if theinput = ° Zocor
rxmed("Zocor")
else if theinput = ° Mirtazapine
rxmed("Mirtazapine")
else if theinput = ° Seroquel
rxmed("Seroquel")
else if theinput = ° Toprol XL
rxmed("Toprol XL")
else if theinput = ° Venlafaxine ER
rxmed("Venlafaxine ER")
else if theinput = ° BuSpar
rxmed("BuSpar")
else if theinput = ° Carvedilol
rxmed("Carvedilol")
else if theinput = ° Clotrimazole
rxmed("Clotrimazole")
else if theinput = ° Ortho Novum 7/7/7 28 day
rxmed("Ortho Novum 7/7/7 28 day")
else if theinput = ° Paroxetine HCl
rxmed("Paroxetine HCl")
else if theinput = ° Valium
rxmed("Valium")
else if theinput = ° Fosamax
rxmed("Fosamax")
else if theinput = ° Glucometer
rxmed("Glucometer")
else if theinput = ° ProAir HFA
rxmed("ProAir HFA")
else if theinput = ° Requip
rxmed("Requip")
else if theinput = ° Bupropion HCl
rxmed("Bupropion HCl")
else if theinput = ° EpiPen Auto-Injector
rxmed("EpiPen Auto-Injector")
else if theinput = ° Diazepam
rxmed("Diazepam")
else if theinput = ° Enalapril Maleate
rxmed("Enalapril Maleate")
else if theinput = ° Geodon
rxmed("Geodon")
else if theinput = ° Metadate ER
rxmed("Metadate ER")
else if theinput = ° Methylin
rxmed("Methylin")
else if theinput = ° Reglan
rxmed("Reglan")
else if theinput = ° Syringes
rxmed("Syringes")
else if theinput = ° Celebrex
rxmed("Celebrex")
else if theinput = ° Chlorthalidone
rxmed("Chlorthalidone")
else if theinput = ° Gemfibrozil
rxmed("Gemfibrozil")
else if theinput = ° Ibuprofen
rxmed("Ibuprofen")
else if theinput = ° Benicar
rxmed("Benicar")
else if theinput = ° Clindamycin HCl
rxmed("Clindamycin HCl")
else if theinput = ° Clonidine HCl
rxmed("Clonidine HCl")
else if theinput = ° Estrace
rxmed("Estrace")
else if theinput = ° Glucophage
rxmed("Glucophage")
else if theinput = ° Lancet
rxmed("Lancet")
else if theinput = ° Lidex
rxmed("Lidex")
else if theinput = ° Prenatal Multivitamin
rxmed("Prenatal Multivitamin")
else if theinput = ° Temazepam
rxmed("Temazepam")
else if theinput = ° Warfarin Sodium
rxmed("Warfarin Sodium")
else if theinput = ° Maxalt
rxmed("Maxalt")
else if theinput = ° Micardis
rxmed("Micardis")
else if theinput = ° Nexium
rxmed("Nexium")
else if theinput = ° Tetracycline HCl
rxmed("Tetracycline HCl")
else if theinput = ° Tri Vit w/Fluoride
rxmed("Tri Vit w/Fluoride")
else if theinput = ° Atorvastatin Calcium
rxmed("Atorvastatin Calcium")
else if theinput = ° Dilantin Kapseals
rxmed("Dilantin Kapseals")
else if theinput = ° NuvaRing
rxmed("NuvaRing")
else if theinput = ° Oxybutynin Chloride
rxmed("Oxybutynin Chloride")
else if theinput = ° Prilosec OTC
rxmed("Prilosec OTC")
else if theinput = ° Ramipril
rxmed("Ramipril")
else if theinput = ° Vosol HC
rxmed("Vosol HC")
else if theinput = ° Azelastine HCl
rxmed("Azelastine HCl")
else if theinput = ° Cymbalta
rxmed("Cymbalta")
else if theinput = ° Diclofenac Sodium
rxmed("Diclofenac Sodium")
else if theinput = ° Ferrous Sulfate
rxmed("Ferrous Sulfate")
else if theinput = ° Humalog
rxmed("Humalog")
else if theinput = ° Isosorbide Mononitrate
rxmed("Isosorbide Mononitrate")
else if theinput = ° Klonopin
rxmed("Klonopin")
else if theinput = ° Levothroid
rxmed("Levothroid")
else if theinput = ° Promethazine HCl
rxmed("Promethazine HCl")
else if theinput = ° Scopolamine
rxmed("Scopolamine")
else if theinput = ° Valtrex
rxmed("Valtrex")
else if theinput = ° Zovirax
rxmed("Zovirax")
else if theinput = ° Bactroban
rxmed("Bactroban")
else if theinput = ° Benicar HCT
rxmed("Benicar HCT")
else if theinput = ° Colchicine
rxmed("Colchicine")
else if theinput = ° Micronor
rxmed("Micronor")
else if theinput = ° Strattera
rxmed("Strattera")
else if theinput = ° Ventolin HFA
rxmed("Ventolin HFA")
else if theinput = ° Combivent
rxmed("Combivent")
else if theinput = ° Methylphenidate HCl
rxmed("Methylphenidate HCl")
else if theinput = ° Nasacort AQ
rxmed("Nasacort AQ")
else if theinput = ° Neurontin
rxmed("Neurontin")
else if theinput = ° Pyridium
rxmed("Pyridium")
else if theinput = ° Vivelle-Dot
rxmed("Vivelle-Dot")
else if theinput = ° Yasmin
rxmed("Yasmin")
else if theinput = ° Allegra
rxmed("Allegra")
else if theinput = ° Auralgan
rxmed("Auralgan")
else if theinput = ° Cholestyramine
rxmed("Cholestyramine")
else if theinput = ° Fenofibrate
rxmed("Fenofibrate")
else if theinput = ° Hydrocortisone
rxmed("Hydrocortisone")
else if theinput = ° Levaquin
rxmed("Levaquin")
else if theinput = ° MetroGel
rxmed("MetroGel")
else if theinput = ° NovoLog Mix 70/30
rxmed("NovoLog Mix 70/30")
else if theinput = ° Phenytoin Sodium, Extended
rxmed("Phenytoin Sodium, Extended")
else if theinput = ° Singulair
rxmed("Singulair")
else if theinput = ° Sodium Fluoride
rxmed("Sodium Fluoride")
else if theinput = ° DuoNeb
rxmed("DuoNeb")
else if theinput = ° Felodipine
rxmed("Felodipine")
else if theinput = ° Lithium Carbonate
rxmed("Lithium Carbonate")
else if theinput = ° Lotensin
rxmed("Lotensin")
else if theinput = ° Miralax
rxmed("Miralax")
else if theinput = ° Nadolol
rxmed("Nadolol")
else if theinput = ° Propoxyphene Napsylate/Acetaminophen
rxmed("Propoxyphene Napsylate/Acetaminophen")
else if theinput = ° Compazine
rxmed("Compazine")
else if theinput = ° Docusate Sodium
rxmed("Docusate Sodium")
else if theinput = ° Drysol
rxmed("Drysol")
else if theinput = ° Insulin Syringes
rxmed("Insulin Syringes")
else if theinput = ° Ketoconazole
rxmed("Ketoconazole")
else if theinput = ° Lamisil
rxmed("Lamisil")
else if theinput = ° Prinivil
rxmed("Prinivil")
else if theinput = ° Spiriva HandiHaler
rxmed("Spiriva HandiHaler")
else if theinput = ° Sumatriptan
rxmed("Sumatriptan")
else if theinput = ° Testosterone Cypionate
rxmed("Testosterone Cypionate")
else if theinput = ° Tri-Sprintec 28
rxmed("Tri-Sprintec 28")
else if theinput = ° Verapamil HCl
rxmed("Verapamil HCl")
else if theinput = ° Voltaren
rxmed("Voltaren")
else if theinput = ° Acetaminophen
rxmed("Acetaminophen")
else if theinput = ° Cortisporin
rxmed("Cortisporin")
else if theinput = ° Diovan
rxmed("Diovan")
else if theinput = ° fluoride
rxmed("fluoride")
else if theinput = ° Lidoderm
rxmed("Lidoderm")
else if theinput = ° Lonox
rxmed("Lonox")
else if theinput = ° Massage Therapy
rxmed("Massage Therapy")
else if theinput = ° Patanol
rxmed("Patanol")
else if theinput = ° Pravachol
rxmed("Pravachol")
else if theinput = ° Prevacid
rxmed("Prevacid")
else if theinput = ° Prinzide
rxmed("Prinzide")
else if theinput = ° Relpax
rxmed("Relpax")
else if theinput = ° Terazosin
rxmed("Terazosin")
else if theinput = ° Triazolam
rxmed("Triazolam")
else if theinput = ° Tylox
rxmed("Tylox")
else if theinput = ° Actos
rxmed("Actos")
else if theinput = ° Asmanex Twisthaler
rxmed("Asmanex Twisthaler")
else if theinput = ° Cipro HC
rxmed("Cipro HC")
else if theinput = ° Clarithromycin
rxmed("Clarithromycin")
else if theinput = ° Cytomel
rxmed("Cytomel")
else if theinput = ° Doxycycline
rxmed("Doxycycline")
else if theinput = ° Flagyl
rxmed("Flagyl")
else if theinput = ° Lexapro
rxmed("Lexapro")
else if theinput = ° Loratadine
rxmed("Loratadine")
else if theinput = ° Macrobid
rxmed("Macrobid")
else if theinput = ° Mebendazole
rxmed("Mebendazole")
else if theinput = ° Nitrofurantoin
rxmed("Nitrofurantoin")
else if theinput = ° Ortho Novum 1/35  28 day
rxmed("Ortho Novum 1/35  28 day")
else if theinput = ° Oxazepam
rxmed("Oxazepam")
else if theinput = ° Tramadol ER
rxmed("Tramadol ER")
else if theinput = ° Zaditor
rxmed("Zaditor")
else if theinput = ° Aricept
rxmed("Aricept")
else if theinput = ° Ascensia CONTOUR Test Strips
rxmed("Ascensia CONTOUR Test Strips")
else if theinput = ° Aspirin (ASA)
rxmed("Aspirin (ASA)")
else if theinput = ° Ciprodex
rxmed("Ciprodex")
else if theinput = ° Concerta
rxmed("Concerta")
else if theinput = ° Lomotil
rxmed("Lomotil")
else if theinput = ° Rosuvastatin
rxmed("Rosuvastatin")
else if theinput = ° Soma
rxmed("Soma")
else if theinput = ° Amoxil
rxmed("Amoxil")
else if theinput = ° Apri 28
rxmed("Apri 28")
else if theinput = ° Avodart
rxmed("Avodart")
else if theinput = ° Benazepril/Hydrochlorothiazide
rxmed("Benazepril/Hydrochlorothiazide")
else if theinput = ° Budeprion SR
rxmed("Budeprion SR")
else if theinput = ° Colace
rxmed("Colace")
else if theinput = ° Differin
rxmed("Differin")
else if theinput = ° Glucose Reagent Blood Test Strips
rxmed("Glucose Reagent Blood Test Strips")
else if theinput = ° Maxalt MLT
rxmed("Maxalt MLT")
else if theinput = ° Niaspan
rxmed("Niaspan")
else if theinput = ° Norvasc
rxmed("Norvasc")
else if theinput = ° Plan B
rxmed("Plan B")
else if theinput = ° Tizanidine HCl
rxmed("Tizanidine HCl")
else if theinput = ° Trimethoprim/Sulfamethoxazole
rxmed("Trimethoprim/Sulfamethoxazole")
else if theinput = ° TriNessa 28
rxmed("TriNessa 28")
else if theinput = ° Valacyclovir
rxmed("Valacyclovir")
else if theinput = ° Vitamin B12
rxmed("Vitamin B12")
else if theinput = ° Zantac
rxmed("Zantac")
else if theinput = ° Zithromax
rxmed("Zithromax")
else if theinput = ° Ambien CR
rxmed("Ambien CR")
else if theinput = ° Astelin
rxmed("Astelin")
else if theinput = ° Digoxin
rxmed("Digoxin")
else if theinput = ° Diltia XT
rxmed("Diltia XT")
else if theinput = ° Ditropan XL
rxmed("Ditropan XL")
else if theinput = ° Finasteride
rxmed("Finasteride")
else if theinput = ° Fluocinonide
rxmed("Fluocinonide")
else if theinput = ° Lactulose
rxmed("Lactulose")
else if theinput = ° Loestrin  Fe 1.5/30  28 day
rxmed("Loestrin  Fe 1.5/30  28 day")
else if theinput = ° Lortab
rxmed("Lortab")
else if theinput = ° Metoprolol ER
rxmed("Metoprolol ER")
else if theinput = ° Mevacor
rxmed("Mevacor")
else if theinput = ° Nasonex
rxmed("Nasonex")
else if theinput = ° NovoLog
rxmed("NovoLog")
else if theinput = ° Ortho Tri-Cyclen  28
rxmed("Ortho Tri-Cyclen  28")
else if theinput = ° Pletal
rxmed("Pletal")
else if theinput = ° Pramipexole
rxmed("Pramipexole")
else if theinput = ° Risperidone
rxmed("Risperidone")
else if theinput = ° Ropinirole HCl
rxmed("Ropinirole HCl")
else if theinput = ° Rythmol
rxmed("Rythmol")
else if theinput = ° Serax
rxmed("Serax")
else if theinput = ° Serevent Diskus
rxmed("Serevent Diskus")
else if theinput = ° Tamsulosin HCl
rxmed("Tamsulosin HCl")
else if theinput = ° Vistaril
rxmed("Vistaril")
else if theinput = ° Vitamin D3
rxmed("Vitamin D3")
else if theinput = ° Welchol
rxmed("Welchol")
else if theinput = ° Yaz
rxmed("Yaz")
else if theinput = ° Aerochamber with Mask (small mask)
rxmed("Aerochamber with Mask (small mask)")
else if theinput = ° Amlodipine/Benazepril
rxmed("Amlodipine/Benazepril")
else if theinput = ° Anusol HC
rxmed("Anusol HC")
else if theinput = ° Cardizem CD
rxmed("Cardizem CD")
else if theinput = ° Chiropactic Treatments
rxmed("Chiropactic Treatments")
else if theinput = ° Ciprofloxacin/Dexamethasone
rxmed("Ciprofloxacin/Dexamethasone")
else if theinput = ° Coreg CR
rxmed("Coreg CR")
else if theinput = ° glucose test strips
rxmed("glucose test strips")
else if theinput = ° Glyburide/Metformin
rxmed("Glyburide/Metformin")
else if theinput = ° Hydromorphone HCl
rxmed("Hydromorphone HCl")
else if theinput = ° Insulin, Regular (Human)
rxmed("Insulin, Regular (Human)")
else if theinput = ° Lanoxin
rxmed("Lanoxin")
else if theinput = ° Lantus SoloSTAR
rxmed("Lantus SoloSTAR")
else if theinput = ° Lidocaine HCl
rxmed("Lidocaine HCl")
else if theinput = ° Low-Ogestrel 28
rxmed("Low-Ogestrel 28")
else if theinput = ° Midrin
rxmed("Midrin")
else if theinput = ° Nicoderm CQ
rxmed("Nicoderm CQ")
else if theinput = ° Nitroglycerin
rxmed("Nitroglycerin")
else if theinput = ° Ondansetron HCl
rxmed("Ondansetron HCl")
else if theinput = ° Opana ER
rxmed("Opana ER")
else if theinput = ° Phentermine HCl
rxmed("Phentermine HCl")
else if theinput = ° Proctofoam-HC
rxmed("Proctofoam-HC")
else if theinput = ° Provera
rxmed("Provera")
else if theinput = ° Restoril
rxmed("Restoril")
else if theinput = ° Septra DS
rxmed("Septra DS")
else if theinput = ° Sprintec
rxmed("Sprintec")
else if theinput = ° Tretinoin
rxmed("Tretinoin")
else if theinput = ° Zomig
rxmed("Zomig")
else if theinput = ° Zyrtec
rxmed("Zyrtec")
else if theinput = ° Acetasol HC
rxmed("Acetasol HC")
else if theinput = ° AcipHex
rxmed("AcipHex")
else if theinput = ° Activella
rxmed("Activella")
else if theinput = ° Alendronate Sodium
rxmed("Alendronate Sodium")
else if theinput = ° Allegra-D 12 Hour
rxmed("Allegra-D 12 Hour")
else if theinput = ° Amphetamine Aspartate & Sulfate/Dextroamphetamine Saccharate & Sulfate
rxmed("Amphetamine Aspartate & Sulfate/Dextroamphetamine Saccharate & Sulfate")
else if theinput = ° Anusol HC 2.5
rxmed("Anusol HC 2.5")
else if theinput = ° Bentyl
rxmed("Bentyl")
else if theinput = ° BenzaClin
rxmed("BenzaClin")
else if theinput = ° Calan SR
rxmed("Calan SR")
else if theinput = ° Calcium Carbonate
rxmed("Calcium Carbonate")
else if theinput = ° Cefuroxime Axetil
rxmed("Cefuroxime Axetil")
else if theinput = ° Clobex
rxmed("Clobex")
else if theinput = ° Darvocet-N 100
rxmed("Darvocet-N 100")
else if theinput = ° Delestrogen
rxmed("Delestrogen")
else if theinput = ° Depo Testosterone
rxmed("Depo Testosterone")
else if theinput = ° Elocon
rxmed("Elocon")
else if theinput = ° Estropipate
rxmed("Estropipate")
else if theinput = ° Etodolac
rxmed("Etodolac")
else if theinput = ° Famciclovir
rxmed("Famciclovir")
else if theinput = ° Famvir
rxmed("Famvir")
else if theinput = ° Fexofenadine HCl
rxmed("Fexofenadine HCl")
else if theinput = ° Glucovance
rxmed("Glucovance")
else if theinput = ° Insulin Glargine (rDNA)
rxmed("Insulin Glargine (rDNA)")
else if theinput = ° Intuniv
rxmed("Intuniv")
else if theinput = ° Keppra XR
rxmed("Keppra XR")
else if theinput = ° Klor-Con M10
rxmed("Klor-Con M10")
else if theinput = ° Levsin
rxmed("Levsin")
else if theinput = ° Loperamide
rxmed("Loperamide")
else if theinput = ° Malarone
rxmed("Malarone")
else if theinput = ° Methocarbamol
rxmed("Methocarbamol")
else if theinput = ° Mobic
rxmed("Mobic")
else if theinput = ° Monistat 1 Combination Pack
rxmed("Monistat 1 Combination Pack")
else if theinput = ° Multivitamin/Mineral Supplement
rxmed("Multivitamin/Mineral Supplement")
else if theinput = ° Naprosyn
rxmed("Naprosyn")
else if theinput = ° Niacin (Nicotinic Acid)
rxmed("Niacin (Nicotinic Acid)")
else if theinput = ° Novolin N
rxmed("Novolin N")
else if theinput = ° Ortho Evra
rxmed("Ortho Evra")
else if theinput = ° Prednisolone
rxmed("Prednisolone")
else if theinput = ° Prometrium
rxmed("Prometrium")
else if theinput = ° Slow-Mag
rxmed("Slow-Mag")
else if theinput = ° Spacer Device
rxmed("Spacer Device")
else if theinput = ° Symbicort
rxmed("Symbicort")
else if theinput = ° Testosterone
rxmed("Testosterone")
else if theinput = ° Vicodin ES
rxmed("Vicodin ES")
else if theinput = ° Voltaren XR
rxmed("Voltaren XR")
else if theinput = ° Aldactazide
rxmed("Aldactazide")
else if theinput = ° Aldactone
rxmed("Aldactone")
else if theinput = ° Aviane 28
rxmed("Aviane 28")
else if theinput = ° Baclofen
rxmed("Baclofen")
else if theinput = ° Betamethasone Diproprionate
rxmed("Betamethasone Diproprionate")
else if theinput = ° Bethanechol Chloride
rxmed("Bethanechol Chloride")
else if theinput = ° Calcium Carbonate/Vitamin D
rxmed("Calcium Carbonate/Vitamin D")
else if theinput = ° Ceftin
rxmed("Ceftin")
else if theinput = ° Cephalexin
rxmed("Cephalexin")
else if theinput = ° Claritin
rxmed("Claritin")
else if theinput = ° Clindamycin Phosphate
rxmed("Clindamycin Phosphate")
else if theinput = ° Cyclocort
rxmed("Cyclocort")
else if theinput = ° Depakote
rxmed("Depakote")
else if theinput = ° Dextromethorphan HBr
rxmed("Dextromethorphan HBr")
else if theinput = ° Dicloxacillin Sodium
rxmed("Dicloxacillin Sodium")
else if theinput = ° Erythromycin Topical
rxmed("Erythromycin Topical")
else if theinput = ° Estring
rxmed("Estring")
else if theinput = ° Fluconazole
rxmed("Fluconazole")
else if theinput = ° Flunisolide
rxmed("Flunisolide")
else if theinput = ° Fluocinolone Acetonide
rxmed("Fluocinolone Acetonide")
else if theinput = ° Fosamax Plus D
rxmed("Fosamax Plus D")
else if theinput = ° Hydralazine HCl
rxmed("Hydralazine HCl")
else if theinput = ° Hydroxyzine HCl
rxmed("Hydroxyzine HCl")
else if theinput = ° Hytrin
rxmed("Hytrin")
else if theinput = ° Imdur
rxmed("Imdur")
else if theinput = ° Ketotifen
rxmed("Ketotifen")
else if theinput = ° Labetalol HCl
rxmed("Labetalol HCl")
else if theinput = ° Lamictal
rxmed("Lamictal")
else if theinput = ° Lantus OptiClik
rxmed("Lantus OptiClik")
else if theinput = ° Loestrin 1.5/30  21 day
rxmed("Loestrin 1.5/30  21 day")
else if theinput = ° Mirena
rxmed("Mirena")
else if theinput = ° Nicotine
rxmed("Nicotine")
else if theinput = ° Nizatidine
rxmed("Nizatidine")
else if theinput = ° Nizoral
rxmed("Nizoral")
else if theinput = ° Novolog Flexpen
rxmed("Novolog Flexpen")
else if theinput = ° Ortho Cyclen  28
rxmed("Ortho Cyclen  28")
else if theinput = ° Ortho Tri-Cyclen Lo 28
rxmed("Ortho Tri-Cyclen Lo 28")
else if theinput = ° Plendil
rxmed("Plendil")
else if theinput = ° Podofilox
rxmed("Podofilox")
else if theinput = ° Poly-Vi-Flor
rxmed("Poly-Vi-Flor")
else if theinput = ° Prevpac
rxmed("Prevpac")
else if theinput = ° Pulmicort Respules
rxmed("Pulmicort Respules")
else if theinput = ° Raloxifene
rxmed("Raloxifene")
else if theinput = ° Remeron
rxmed("Remeron")
else if theinput = ° Robaxin
rxmed("Robaxin")
else if theinput = ° Seasonale
rxmed("Seasonale")
else if theinput = ° Selegiline HCl
rxmed("Selegiline HCl")
else if theinput = ° Senna
rxmed("Senna")
else if theinput = ° Septra
rxmed("Septra")
else if theinput = ° Slo-Niacin
rxmed("Slo-Niacin")
else if theinput = ° Tamiflu
rxmed("Tamiflu")
else if theinput = ° Vicoprofen
rxmed("Vicoprofen")
else if theinput = ° Vimpat
rxmed("Vimpat")
else if theinput = ° Zanaflex
rxmed("Zanaflex")
else if theinput = ° Zithromax Z-Pak
rxmed("Zithromax Z-Pak")
else if theinput = ° Advicor
rxmed("Advicor")
else if theinput = ° Aggrenox
rxmed("Aggrenox")
else if theinput = ° Amiodarone HCl
rxmed("Amiodarone HCl")
else if theinput = ° AndroGel 2.5G
rxmed("AndroGel 2.5G")
else if theinput = ° Anusol
rxmed("Anusol")
else if theinput = ° Arimidex
rxmed("Arimidex")
else if theinput = ° Armour Thyroid
rxmed("Armour Thyroid")
else if theinput = ° Atrovent HFA
rxmed("Atrovent HFA")
else if theinput = ° Augmentin ES-600
rxmed("Augmentin ES-600")
else if theinput = ° Bactrim Pediatric
rxmed("Bactrim Pediatric")
else if theinput = ° Bactroban Nasal
rxmed("Bactroban Nasal")
else if theinput = ° Beconase AQ
rxmed("Beconase AQ")
else if theinput = ° Betamethasone Valerate
rxmed("Betamethasone Valerate")
else if theinput = ° Bisoprolol/Hydrochlorthiazide
rxmed("Bisoprolol/Hydrochlorthiazide")
else if theinput = ° Cetirizine HCl
rxmed("Cetirizine HCl")
else if theinput = ° chiropracter
rxmed("chiropracter")
else if theinput = ° Ciprofloxacin/Hydrocortisone
rxmed("Ciprofloxacin/Hydrocortisone")
else if theinput = ° Codeine Sulfate
rxmed("Codeine Sulfate")
else if theinput = ° Demerol HCl
rxmed("Demerol HCl")
else if theinput = ° Dexamethasone
rxmed("Dexamethasone")
else if theinput = ° Dexedrine
rxmed("Dexedrine")
else if theinput = ° Dextroamphetamine
rxmed("Dextroamphetamine")
else if theinput = ° Ditropan
rxmed("Ditropan")
else if theinput = ° Dovonex
rxmed("Dovonex")
else if theinput = ° Dulcolax
rxmed("Dulcolax")
else if theinput = ° Duragesic
rxmed("Duragesic")
else if theinput = ° Elidel
rxmed("Elidel")
else if theinput = ° Erythromycin/Benzoyl Peroxide
rxmed("Erythromycin/Benzoyl Peroxide")
else if theinput = ° Etanercept
rxmed("Etanercept")
else if theinput = ° Ethinyl Estradiol /Ethynodiol Diacetate
rxmed("Ethinyl Estradiol /Ethynodiol Diacetate")
else if theinput = ° Fentanyl
rxmed("Fentanyl")
else if theinput = ° Ferrous Gluconate
rxmed("Ferrous Gluconate")
else if theinput = ° Folic Acid
rxmed("Folic Acid")
else if theinput = ° Glucagon Emergency
rxmed("Glucagon Emergency")
else if theinput = ° Glycolax
rxmed("Glycolax")
else if theinput = ° Halcion
rxmed("Halcion")
else if theinput = ° Humulin 70/30
rxmed("Humulin 70/30")
else if theinput = ° Humulin R
rxmed("Humulin R")
else if theinput = ° Imodium A-D
rxmed("Imodium A-D")
else if theinput = ° Indocin
rxmed("Indocin")
else if theinput = ° Insulin, Isophane Suspension (NPH, Human)
rxmed("Insulin, Isophane Suspension (NPH, Human)")
else if theinput = ° Ivermectin
rxmed("Ivermectin")
else if theinput = ° Levofloxacin
rxmed("Levofloxacin")
else if theinput = ° Lodine
rxmed("Lodine")
else if theinput = ° Loestrin  Fe 1/20  28 day
rxmed("Loestrin  Fe 1/20  28 day")
else if theinput = ° Loratadine/Pseudoephedrine
rxmed("Loratadine/Pseudoephedrine")
else if theinput = ° Lumigan
rxmed("Lumigan")
else if theinput = ° Lybrel
rxmed("Lybrel")
else if theinput = ° Macrodantin
rxmed("Macrodantin")
else if theinput = ° Medrol
rxmed("Medrol")
else if theinput = ° Medroxyprogesterone Acetate
rxmed("Medroxyprogesterone Acetate")
else if theinput = ° Metadate CD
rxmed("Metadate CD")
else if theinput = ° Metoclopramide HCl
rxmed("Metoclopramide HCl")
else if theinput = ° Metoprolol Succinate
rxmed("Metoprolol Succinate")
else if theinput = ° Micatin
rxmed("Micatin")
else if theinput = ° Miconazole Nitrate
rxmed("Miconazole Nitrate")
else if theinput = ° Mircette
rxmed("Mircette")
else if theinput = ° Monopril
rxmed("Monopril")
else if theinput = ° Nabumetone
rxmed("Nabumetone")
else if theinput = ° Nitrostat
rxmed("Nitrostat")
else if theinput = ° Novofine needle
rxmed("Novofine needle")
else if theinput = ° Prempro
rxmed("Prempro")
else if theinput = ° Proctosol-HC
rxmed("Proctosol-HC")
else if theinput = ° Promethazine with Codeine
rxmed("Promethazine with Codeine")
else if theinput = ° Provigil
rxmed("Provigil")
else if theinput = ° Pseudoephedrine HCl
rxmed("Pseudoephedrine HCl")
else if theinput = ° Quinapril
rxmed("Quinapril")
else if theinput = ° Retin-A
rxmed("Retin-A")
else if theinput = ° Robitussin A-C
rxmed("Robitussin A-C")
else if theinput = ° Sanctura XR
rxmed("Sanctura XR")
else if theinput = ° Selenium Sulfide
rxmed("Selenium Sulfide")
else if theinput = ° Sulfasalazine
rxmed("Sulfasalazine")
else if theinput = ° Tenoretic 50
rxmed("Tenoretic 50")
else if theinput = ° Tioconazole
rxmed("Tioconazole")
else if theinput = ° Torsemide
rxmed("Torsemide")
else if theinput = ° Tussionex
rxmed("Tussionex")
else if theinput = ° Ultram
rxmed("Ultram")
else if theinput = ° Vancomycin HCl
rxmed("Vancomycin HCl")
else if theinput = ° Veramyst
rxmed("Veramyst")
else if theinput = ° Vicodin HP
rxmed("Vicodin HP")
else if theinput = ° Vitamin C
rxmed("Vitamin C")
else if theinput = ° Vitamin K
rxmed("Vitamin K")
else if theinput = ° Vytorin
rxmed("Vytorin")
else if theinput = ° Zonisamide
rxmed("Zonisamide")
else if theinput = ° Aldara
rxmed("Aldara")
else if theinput = ° AndroGel 5.0G
rxmed("AndroGel 5.0G")
else if theinput = ° AndroGel Pump
rxmed("AndroGel Pump")
else if theinput = ° Arthrotec 50
rxmed("Arthrotec 50")
else if theinput = ° Atacand
rxmed("Atacand")
else if theinput = ° Avandia
rxmed("Avandia")
else if theinput = ° Avar Green
rxmed("Avar Green")
else if theinput = ° Axert
rxmed("Axert")
else if theinput = ° Azathioprine
rxmed("Azathioprine")
else if theinput = ° Azelaic Acid
rxmed("Azelaic Acid")
else if theinput = ° Biaxin
rxmed("Biaxin")
else if theinput = ° Bisacodyl
rxmed("Bisacodyl")
else if theinput = ° Boniva
rxmed("Boniva")
else if theinput = ° Carbamazepine
rxmed("Carbamazepine")
else if theinput = ° Catapres-TTS
rxmed("Catapres-TTS")
else if theinput = ° Cefadroxil
rxmed("Cefadroxil")
else if theinput = ° Cefixime
rxmed("Cefixime")
else if theinput = ° Chloroquine Phosphate
rxmed("Chloroquine Phosphate")
else if theinput = ° Cilostazol
rxmed("Cilostazol")
else if theinput = ° Clopidogrel
rxmed("Clopidogrel")
else if theinput = ° Codeine Phosphate
rxmed("Codeine Phosphate")
else if theinput = ° Compression Hose
rxmed("Compression Hose")
else if theinput = ° Coreg
rxmed("Coreg")
else if theinput = ° Cryselle
rxmed("Cryselle")
else if theinput = ° D.H.E. 45
rxmed("D.H.E. 45")
else if theinput = ° Desonide
rxmed("Desonide")
else if theinput = ° Diphenhydramine HCl
rxmed("Diphenhydramine HCl")
else if theinput = ° Divalproex Sodium
rxmed("Divalproex Sodium")
else if theinput = ° Dyazide
rxmed("Dyazide")
else if theinput = ° Econazole Nitrate
rxmed("Econazole Nitrate")
else if theinput = ° Enoxaparin
rxmed("Enoxaparin")
else if theinput = ° Estraderm
rxmed("Estraderm")
else if theinput = ° Famotidine
rxmed("Famotidine")
else if theinput = ° Fexofenadine/Pseudoephedrine
rxmed("Fexofenadine/Pseudoephedrine")
else if theinput = ° Flector
rxmed("Flector")
else if theinput = ° Fludrocortisone Acetate
rxmed("Fludrocortisone Acetate")
else if theinput = ° Fluvoxamine Maleate
rxmed("Fluvoxamine Maleate")
else if theinput = ° Fosinopril/Hydrochlorothiazide
rxmed("Fosinopril/Hydrochlorothiazide")
else if theinput = ° Glucotrol XL
rxmed("Glucotrol XL")
else if theinput = ° Guaifenesin
rxmed("Guaifenesin")
else if theinput = ° Guiatuss AC
rxmed("Guiatuss AC")
else if theinput = ° Haloperidol
rxmed("Haloperidol")
else if theinput = ° Ipratropium Bromide
rxmed("Ipratropium Bromide")
else if theinput = ° Keppra
rxmed("Keppra")
else if theinput = ° Lamisil AT
rxmed("Lamisil AT")
else if theinput = ° Lamotrigine
rxmed("Lamotrigine")
else if theinput = ° Levalbuterol
rxmed("Levalbuterol")
else if theinput = ° Levemir
rxmed("Levemir")
else if theinput = ° Librax (w/clidinium)
rxmed("Librax (w/clidinium)")
else if theinput = ° Lotrel
rxmed("Lotrel")
else if theinput = ° Lotrimin AF
rxmed("Lotrimin AF")
else if theinput = ° Lotrisone
rxmed("Lotrisone")
else if theinput = ° Lovenox
rxmed("Lovenox")
else if theinput = ° Lyrica
rxmed("Lyrica")
else if theinput = ° Malathion
rxmed("Malathion")
else if theinput = ° Meclizine HCl
rxmed("Meclizine HCl")
else if theinput = ° Melatonin
rxmed("Melatonin")
else if theinput = ° Metamucil
rxmed("Metamucil")
else if theinput = ° Methotrexate Sodium
rxmed("Methotrexate Sodium")
else if theinput = ° Methylprednisolone
rxmed("Methylprednisolone")
else if theinput = ° Milk Of Magnesia
rxmed("Milk Of Magnesia")
else if theinput = ° Monistat 7
rxmed("Monistat 7")
else if theinput = ° Mupirocin
rxmed("Mupirocin")
else if theinput = ° Naproxen Sodium
rxmed("Naproxen Sodium")
else if theinput = ° Necon 0.5/35 28 day
rxmed("Necon 0.5/35 28 day")
else if theinput = ° Necon 1/35 28 day
rxmed("Necon 1/35 28 day")
else if theinput = ° Niacinamide
rxmed("Niacinamide")
else if theinput = ° Nicorette
rxmed("Nicorette")
else if theinput = ° Nifediac CC
rxmed("Nifediac CC")
else if theinput = ° Nix Creme Rinse
rxmed("Nix Creme Rinse")
else if theinput = ° Norco
rxmed("Norco")
else if theinput = ° Nortrel 7/7/7
rxmed("Nortrel 7/7/7")
else if theinput = ° Novolin 70/30
rxmed("Novolin 70/30")
else if theinput = ° NovoLog Mix 70/30 FlexPen
rxmed("NovoLog Mix 70/30 FlexPen")
else if theinput = ° Nuvigil
rxmed("Nuvigil")
else if theinput = ° Ogestrel 28
rxmed("Ogestrel 28")
else if theinput = ° One Touch Basic Monitor
rxmed("One Touch Basic Monitor")
else if theinput = ° Peak Flow Meter
rxmed("Peak Flow Meter")
else if theinput = ° Plan B One-Step
rxmed("Plan B One-Step")
else if theinput = ° Polymyxin B/Trimethoprim
rxmed("Polymyxin B/Trimethoprim")
else if theinput = ° Polytrim
rxmed("Polytrim")
else if theinput = ° Pregabalin
rxmed("Pregabalin")
else if theinput = ° Prenatal Multivitamin & DHA
rxmed("Prenatal Multivitamin & DHA")
else if theinput = ° Primidone
rxmed("Primidone")
else if theinput = ° Prochlorperazine
rxmed("Prochlorperazine")
else if theinput = ° Protopic
rxmed("Protopic")
else if theinput = ° Pulmicort Flexhaler
rxmed("Pulmicort Flexhaler")
else if theinput = ° Questran
rxmed("Questran")
else if theinput = ° Quinapril/Hydrochlorothiazide
rxmed("Quinapril/Hydrochlorothiazide")
else if theinput = ° Quinine Sulfate
rxmed("Quinine Sulfate")
else if theinput = ° Relafen
rxmed("Relafen")
else if theinput = ° Retin-A Micro
rxmed("Retin-A Micro")
else if theinput = ° Rhinocort Aqua
rxmed("Rhinocort Aqua")
else if theinput = ° Rifampin
rxmed("Rifampin")
else if theinput = ° Rifaximin
rxmed("Rifaximin")
else if theinput = ° Senna-Gen
rxmed("Senna-Gen")
else if theinput = ° Sildenafil Citrate
rxmed("Sildenafil Citrate")
else if theinput = ° Silver Sulfadiazine
rxmed("Silver Sulfadiazine")
else if theinput = ° Sinemet-CR
rxmed("Sinemet-CR")
else if theinput = ° Tacrolimus
rxmed("Tacrolimus")
else if theinput = ° Temovate
rxmed("Temovate")
else if theinput = ° Tenormin
rxmed("Tenormin")
else if theinput = ° Tiotropium Bromide
rxmed("Tiotropium Bromide")
else if theinput = ° Topiramate
rxmed("Topiramate")
else if theinput = ° Tricor
rxmed("Tricor")
else if theinput = ° Triple Antibiotic
rxmed("Triple Antibiotic")
else if theinput = ° Tylenol, Children's
rxmed("Tylenol, Children's")
else if theinput = ° Tylenol, Infants' Drops
rxmed("Tylenol, Infants' Drops")
else if theinput = ° Ultram ER
rxmed("Ultram ER")
else if theinput = ° Ventolin
rxmed("Ventolin")
else if theinput = ° Vermox
rxmed("Vermox")
else if theinput = ° VESIcare
rxmed("VESIcare")
else if theinput = ° Vitamin K
rxmed("Vitamin K")
else if theinput = ° Vivelle
rxmed("Vivelle")
else if theinput = ° Xylocaine Viscous
rxmed("Xylocaine Viscous")
else if theinput = ° Zanamivir
rxmed("Zanamivir")
else if theinput = ° Zaroxolyn
rxmed("Zaroxolyn")
else if theinput = ° Zestoretic
rxmed("Zestoretic")
else if theinput = ° Zyrtec-D 12 Hour
rxmed("Zyrtec-D 12 Hour")
}

