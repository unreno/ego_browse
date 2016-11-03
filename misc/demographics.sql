
SELECT id INTO @race_qid
FROM question WHERE studyId = 1 AND title = 'RACE';

SELECT id INTO @hisplat_qid
FROM question WHERE studyId = 1 AND title = 'HISPLAT';

SELECT id INTO @gender_qid
FROM question WHERE studyId = 1 AND title = 'GENDER';

SELECT i.id, r.value AS race, h.value AS hisplat, g.value AS gender
FROM interview i
LEFT JOIN answer r
	ON i.id = r.interviewId AND r.questionId = @race_qid
LEFT JOIN answer h
	ON i.id = h.interviewId AND h.questionId = @hisplat_qid
LEFT JOIN answer g
	ON i.id = g.interviewId AND g.questionId = @gender_qid
WHERE i.studyId = 1;

