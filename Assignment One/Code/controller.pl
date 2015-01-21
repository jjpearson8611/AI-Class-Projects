%this is the load and go for our project
%This is in charge of loading the six files into prolog
%re-routing output to a file called Asgn1.txt
%automatically runs the questions

loadandgo():-
	consult('database.pl'),
	consult('knowledgeBase.pl'),
	consult('query.pl'),
	consult('questions.pl'),
	consult('translator.pl'),
	consult('runQuestions.pl').
