\echo -----------------------STF_CORP_RECORD------------------------
select now();
\timing
delete from STF_CORP_RECORD using STF_CORP_RECORD_GPTMP_TODAY where STF_CORP_RECORD.ENTRY_ID=STF_CORP_RECORD_GPTMP_TODAY.ENTRY_ID ;
insert into STF_CORP_RECORD (ENTRY_ID,STF_CORP_ID,MANUAL_CORP_NO,I_E_FLAG,UNIT_CODE,STF_CORP_DATE1,STF_CORP_ER1,STF_CORP_DATE2,STF_CORP_ER2,ROOM_CORP_NO,NOTE_TEXT) select ENTRY_ID,STF_CORP_ID,MANUAL_CORP_NO,I_E_FLAG,UNIT_CODE,STF_CORP_DATE1,STF_CORP_ER1,STF_CORP_DATE2,STF_CORP_ER2,ROOM_CORP_NO,NOTE_TEXT from STF_CORP_RECORD_GPTMP_TODAY  where CMD_TYPE='I';
\timing
