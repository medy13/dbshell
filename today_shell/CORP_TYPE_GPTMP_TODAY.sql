\echo ------------------CORP_TYPE----------------
select now();
\timing
delete from CORP_TYPE_GPTMP;
insert into CORP_TYPE_GPTMP (CMD_TYPE,CORP_TYPE) select CMD_TYPE,CORP_TYPE from CORP_TYPE_INC_EXT;
delete from CORP_TYPE_GPTMP_TODAY using CORP_TYPE_GPTMP where CORP_TYPE_GPTMP.CORP_TYPE=CORP_TYPE_GPTMP_TODAY.CORP_TYPE ;
insert into CORP_TYPE_GPTMP_TODAY (CMD_TYPE,CORP_TYPE,MANUAL_TAG) select CMD_TYPE,CORP_TYPE,MANUAL_TAG from CORP_TYPE_INC_EXT;
delete from CORP_TYPE_GPTMP;
\timing