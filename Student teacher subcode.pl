teaches(Lisa, prof_lara, math, 1234).
teaches(Sam, prof_bot, chem, 334).
teaches(William, para_wanda, phy, 12345).
enrolled(sai, ai, 1222).
db_Student(Name, teacher, subject, code) :-
	teaches(Name, teacher, subject, code).
db_enrolled(Name, subject, code) :-
	enrolled(Name, subject, code).