/* prolog tutorial 2.17 Disease identification . start with ?- go. */

go :- hypothesize(Disease),
      write('you got : '),
      write(Disease),
      nl,
      undo.

/* hypotheses to be tested */
hypothesize(cluster1)   :- cluster1,!.
hypothesize(cluster2)   :- cluster2,!.
hypothesize(cluster3)   :- cluster3,!.
hypothesize(cluster4)   :- cluster4,!.
hypothesize(cluster5)   :- cluster5,!.
hypothesize(cluster6)   :- cluster6,!.

hypothesize(pneumonia)  :- pneumonia,!.
hypothesize(tuberculosis) :- tuberculosis,!.
hypothesize(influenza) :-influenza,!.
hypothesize(asthma) :- asthma,!.


hypothesize(unknown).       /* no diagnosis */


/* Disease identification rules */

cluster1 :- verify(feel_cold),
           verify(sore_throat),
           verify(feel_blocked_nose),
           verify(feel_chest_pain),
           verify(feel_muscles_pain),
           verify(loss_of_smell),
           verify(headche),
           not(verify(has_fever)).

cluster2 :- verify(has_fever),
            verify(loss_of_appetite),
            verify(dry_cough).

cluster3 :- verify(feel_nausea),
           verify(loss_of_appetite),
           verify(vomitting),
           verify(feel_diarohea),
           verify(feel_headche),
           verify(feel_chest_pain).

cluster4 :- verify(energy_loss),
            verify(exhaustion).

cluster5 :-verify(feel_headche),
            verify(loss_of_smell),
            verify(loss_of_appetite),
            verify(dry_cough),
            verify(has_fever),
            verify(hoarseness_in_the_voice),
            verify(feel_confused),
            verify(feel_sore_throat),
            verify(feel_chest_pain),
            verify(feel_fatigue),
            verify(feel_muscles_pain).

cluster6 :- verify(confusion),
            verify(feel_sore_throat),
            verify(has_chronic_fever),
            verify(loss_of_appetite),
            verify(feel_headche),
            verify(feel_diarohea),
            verify(shortness_of_breath),
            verify(pain_in_abdominal).

pneumonia :-verify(shortness_of_breath),
            verify(shaking_chills),
            verify(exhaustion),
            verify(dry_cough),
            verify(has_fever).

tuberculosis :-verify(coughing_blood),
             verify(has_fever),
            verify(night_sweats),
            verify(constant_fatigue).

influenza :- verify(wheezing),
             verify(has_cough),
            verify(nasal_congestion),
            verify(runny_nose).

 asthma:- verify(has_fever),
            verify(feel_headche),
            verify(chest_tightness),
            verify(shortness_of_breath).



/* classification rules */
cold:- verify(feel_cold),!.
feel_sore_throat :- verify(feel_sore_throat),!.
blocked_nose:- verify(feel_blocked_nose), !.
shaking_chills :- verify(feel_shaking_chills),!.
chest_pain :- verify(feel_chest_pain).
loss_of_smell :- verify(loss_of_smell),!.
coughing_blood :- verify(coughing_blood),!.
night_sweats :- verify(night_sweats),!.
wheezing :- verify(wheezing),!.
chest_tightness :- verify(chest_tightness),!.
headache :- verify(feel_headche).
fever :-verify(has_fever),!.
loss_of_appetite :- verify(loss_of_appetite),!.
dry_cough:-verify(feel_dry_cough); verify(hoarseness_in_the_voice),!.
nausea:-verify(feel_nausea);verify(vomiting),!.
diarrhoea:-verify(feel_diarohea),!.
exhaustion:-verify(feel_exhaustive);verify(energy_loss),!.
confusion:-verify(feel_confused),!.
fatigue:-verify(feel_fatigue),!.
muscle_pain:-verify(feel_muscles_pain),!.
chronic_fever:-verify(has_chronic_fever),!.
short_breath:-verify(shortness_of_breath),!.
abdominal_pain:-verify(pain_in_abdominal),!.

/* how to ask questions */
ask(Question) :-
    write('Describe for us what you feel ? '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
