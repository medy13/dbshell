\echo ------------------EXAM_CONTA_LIST----------------
select now();
\timing
insert into EXAM_CONTA_LIST_GPTMP (CMD_TYPE,EXAM_REC_ID, CONTA_ID) select CMD_TYPE,EXAM_REC_ID, CONTA_ID from EXAM_CONTA_LIST_INC_EXT;

delete from EXAM_CONTA_LIST using EXAM_CONTA_LIST_GPTMP where EXAM_CONTA_LIST_GPTMP.EXAM_REC_ID=EXAM_CONTA_LIST.EXAM_REC_ID AND EXAM_CONTA_LIST_GPTMP.CONTA_ID=EXAM_CONTA_LIST.CONTA_ID ;

insert into EXAM_CONTA_LIST(EXAM_REC_ID,CONTA_ID,HOLLOW_AREA1,HOLLOW_AREA2,CHK_SEAL,CHK_TRUNK,CHK_CONTA_ID,EXAM_RESULT) select EXAM_REC_ID,CONTA_ID,HOLLOW_AREA1,HOLLOW_AREA2,CHK_SEAL,CHK_TRUNK,CHK_CONTA_ID,EXAM_RESULT from EXAM_CONTA_LIST_INC_EXT where CMD_TYPE='I';

delete from EXAM_CONTA_LIST_GPTMP;

\timing
