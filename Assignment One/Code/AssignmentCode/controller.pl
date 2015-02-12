%Controller jason pearson CS5820 assign 1
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