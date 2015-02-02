%this is the load and go for our project
%This is in charge of loading the six files into prolog
%re-routing output to a file called Asgn1.txt
%automatically runs the questions

go :-
	consult('database.pl'),
	consult('knowledgebase.pl'),
	consult('query.pl'),
	consult('questions.pl'),
	consult('translator.pl'),
	consult('runquestions.pl'),
	tell('log.txt'),
	doExam,
	told.

:- go.