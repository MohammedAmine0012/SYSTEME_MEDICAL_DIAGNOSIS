% Logic pour le traitement des données

% Predicate qui gère les entrées de l'utilisateur
ask_user_data(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE) :-
    % Affichage des données pour vérifier que Prolog les reçoit correctement
    write('Age: '), write(Age), nl,
    write('Sex: '), write(Sex), nl,
    write('Body Area (BA): '), write(BA), nl,
    write('Blood Glucose (BGR): '), write(BGR), nl,
    write('Blood Urea (BU): '), write(BU), nl,
    write('Serum Creatinine (SC): '), write(SC), nl,
    write('Serum Osmolality (SOD): '), write(SOD), nl,
    write('Hemoglobin (HEMO): '), write(HEMO), nl,
    write('Peripheral Vascular Disease (PVC): '), write(PVC), nl,
    write('White Cell Count (WC): '), write(WC), nl,
    write('Red Cell Count (RC): '), write(RC), nl,
    write('Hypertension (HTN): '), write(HTN), nl,
    write('Diabetes Mellitus (DM): '), write(DM), nl,
    write('Coronary Artery Disease (CAD): '), write(CAD), nl,
    write('Appetite: '), write(Appet), nl,
    write('Pulmonary Edema (PE): '), write(PE), nl,
    write('Anemia (ANE): '), write(ANE), nl,
    
    % Simuler un traitement des données (ici, un simple exemple de décision)
    decision(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, Result),
    
    % Affichage du résultat de la décision
    write('Decision Result: '), write(Result), nl.

% Exemple de prédicat de décision basé sur les données
decision(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'High Risk') :-
    Age > 50, HTN = 1, DM = 1.
decision(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Medium Risk') :-
    Age > 30, (HTN = 1; DM = 1), Appet = normal.
decision(Age, Sex, BA, BGR, BU, SC, SOD, HEMO, PVC, WC, RC, HTN, DM, CAD, Appet, PE, ANE, 'Low Risk') :-
    Age =< 30, HTN = 0, DM = 0, Appet = normal.
decision(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, 'No Data').

