\echo ------------------OTHER_STF_RECORD----------------
select now();
\timing
delete from OTHER_STF_RECORD_GPTMP;
insert into OTHER_STF_RECORD_GPTMP (CMD_TYPE,OTHER_ID, ID_TYPE) select CMD_TYPE,OTHER_ID, ID_TYPE from OTHER_STF_RECORD_INC_EXT;
delete from OTHER_STF_RECORD_GPTMP_TODAY using OTHER_STF_RECORD_GPTMP where OTHER_STF_RECORD_GPTMP.OTHER_ID=OTHER_STF_RECORD_GPTMP_TODAY.OTHER_ID AND OTHER_STF_RECORD_GPTMP.ID_TYPE=OTHER_STF_RECORD_GPTMP_TODAY.ID_TYPE ;
insert into OTHER_STF_RECORD_GPTMP_TODAY (CMD_TYPE,OTHER_ID,STF_ID,MANUAL_NO,I_E_FLAG,STF_DATE1,STF_ER1,STF_DATE2,STF_ER2,ROOM_NO,NOTE_TEXT,ID_TYPE) select CMD_TYPE,OTHER_ID,STF_ID,MANUAL_NO,I_E_FLAG,STF_DATE1,STF_ER1,STF_DATE2,STF_ER2,ROOM_NO,NOTE_TEXT,ID_TYPE from OTHER_STF_RECORD_INC_EXT;
delete from OTHER_STF_RECORD_GPTMP;
\timing