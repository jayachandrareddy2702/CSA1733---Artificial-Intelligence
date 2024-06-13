symptom(john, fever).
symptom(john, cough).
symptom(john, headache).
disease(john, flu).
disease(john,nausea).
diagnose(Patient, Disease) :-
    symptom(Patient, symptom).
    disease(Patient, Disease).
