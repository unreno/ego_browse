
ALTER TABLE matchedAlters ADD interviewId1 INT(11);
ALTER TABLE matchedAlters ADD interviewId2 INT(11);
ALTER TABLE matchedAlters ADD userId INT(11);
ALTER TABLE study ADD header LONGTEXT;

--	The answer values for several questions are the same for each answer.
--	Change No value to 0 for the following 3 questions.
--	SMOKED_EV, CALL911, SABUSERU18GANG

--	SELECT * FROM question WHERE studyId = 2 AND title = 'SMOKED_EV';
--	Question SMOKED_EV, id 601
--	SELECT * FROM questionOption WHERE questionId = 601;
--	QuestionOption No (id 2317)
--	SELECT * FROM questionOption WHERE id = 2317;

UPDATE questionOption SET value = 0 WHERE id = 2317;

--	SELECT * FROM question WHERE studyId = 2 AND title = 'CALL911';
--	Question CALL911, id 393
--	SELECT * FROM questionOption WHERE questionId = 393;
--	QuestionOption No (id 1492)
--	SELECT * FROM questionOption WHERE id = 1492;

UPDATE questionOption SET value = 0 WHERE id = 1492;

--	SELECT * FROM question WHERE studyId = 2 AND title = 'SABUSERU18GANG';
--	Question SABUSERU18GANG, id 634
--	SELECT * FROM questionOption WHERE questionId = 634;
--	QuestionOption No (id 2430)
--	SELECT * FROM questionOption WHERE id = 2430;

UPDATE questionOption SET value = 0 WHERE id = 2430;

