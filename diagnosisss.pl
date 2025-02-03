

% Règles de diagnostic
diagnostic_polycystic_kidney_disease(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    Age > 32,
    Age =< 56,
    Sex = male,
    (BGR > 115 ; SC > 0.8),  % Assouplissement de la condition pour BGR et SC
    (HEMO < 12 ; PVC > 3),   % Assouplissement de la condition pour HEMO et PVC
    (Appet = normal ; Appet = low),
    PE = 0, ANE = 1.


diagnostic_nephrotic_syndrome(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    Age > 46,
    Sex = male,
    (BGR > 180 ; SC > 1.8),
    PVC > 4,
    (HTN = 1 ; DM = 1),
    PE = 0, ANE = 1.


diagnostic_crf(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    Age > 60,
    Sex = female,
    (BU > 60 ; SC > 1.5),
    PVC > 4,
    (HTN = 1 ; DM = 1 ; CAD = 1),
    (WC = 7 ; RC = 5),
    PE = 0, ANE = 1.


diagnostic_diabetic_nephropathy(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    DM = 1,                  % Presence of diabetes
    (BGR > 180 ; SC > 1.5),  % Elevated blood glucose or serum creatinine
    BU > 60,                 % Elevated blood urea nitrogen
    HEMO < 12,               % Anemia due to reduced erythropoietin production
    PVC < 5,                 % Reduced packed cell volume
    PE = 1,                  % Proteinuria is a hallmark of diabetic nephropathy
    ANE = 1.


diagnostic_hypertensive_nephropathy(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    HTN = 1,                  % Presence of hypertension
    SC > 1.4,                 % Elevated serum creatinine
    BU > 55,                  % Elevated blood urea nitrogen
    HEMO < 11,                % Anemia is common in kidney damage
    PVC < 4,                  % Reduced packed cell volume
    SOD > 145,                % High sodium levels
    PE = 1,                   % Proteinuria
    ANE = 1.


diagnostic_urinary_tract_infection(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    WC > 12,                  % Elevated white cell count indicating infection
    RC > 6,                   % Elevated red cell count in case of hematuria
    (BU > 40 ; SC > 1.2),     % Elevated BU and SC may occur due to kidney involvement
    PE = 1,                   % Proteinuria may occur in severe cases
    Appet = normal,           % Appetite is often unaffected
    ANE = 0.                  % No anemia in most uncomplicated UTIs


diagnostic_kidney_stones(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    (BU > 40 ; SC > 1.3),
    RC > 6,                   % Hematuria is common in kidney stones
    SOD > 140,                % Altered sodium levels
    Appet = normal,
    PE = 0,                   % Proteinuria is usually absent
    ANE = 0.


diagnostic_acute_kidney_injury(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    (BU > 70 ; SC > 2.0),
    HEMO < 10,                % Severe anemia may occur
    PVC < 4,
    PE = 1,                   % Proteinuria may occur in severe cases
    ANE = 1.


diagnostic_glomerulonephritis(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    WC > 10,                  % Elevated white blood cell count
    RC > 5,                   % Hematuria
    BU > 50,
    SC > 1.4,
    PE = 1,
    ANE = 1.


diagnostic_renal_tubular_acidosis(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    SC > 1.2,
    SOD < 135,                % Hyponatremia
    HEMO < 11,
    PVC < 3,
    PE = 0,
    ANE = 0.


diagnostic_renal_cyst(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    SC > 1.1,
    BU > 35,
    RC > 4,
    Appet = normal,
    PE = 0,
    ANE = 0.

% Prédiction
predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Nephrotic Syndrome') :-
    diagnostic_nephrotic_syndrome(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Polycystic Kidney Disease') :-
    diagnostic_polycystic_kidney_disease(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Chronic Renal Failure') :-
    diagnostic_crf(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Diabetic Nephropathy') :-
    diagnostic_diabetic_nephropathy(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.
predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Hypertensive Nephropathy') :-
    diagnostic_hypertensive_nephropathy(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Urinary Tract Infection') :-
    diagnostic_urinary_tract_infection(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Kidney Stones') :-
    diagnostic_kidney_stones(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Acute Kidney Injury') :-
    diagnostic_acute_kidney_injury(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Glomerulonephritis') :-
    diagnostic_glomerulonephritis(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Renal Tubular Acidosis') :-
    diagnostic_renal_tubular_acidosis(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

predire_diagnostic(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Renal Cyst') :-
    diagnostic_renal_cyst(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE), !.

% Cas par défaut si aucun diagnostic ne correspond
predire_diagnostic(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 'Unknown Diagnosis').

