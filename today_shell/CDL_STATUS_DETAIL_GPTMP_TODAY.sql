\echo ------------------CDL_STATUS_DETAIL----------------
select now();
\timing
delete from CDL_STATUS_DETAIL_GPTMP;
insert into CDL_STATUS_DETAIL_GPTMP (CMD_TYPE,LIST_NO, DETAIL_COUNT) select CMD_TYPE,LIST_NO, DETAIL_COUNT from CDL_STATUS_DETAIL_INC_EXT;
delete from CDL_STATUS_DETAIL_GPTMP_TODAY using CDL_STATUS_DETAIL_GPTMP where CDL_STATUS_DETAIL_GPTMP.LIST_NO=CDL_STATUS_DETAIL_GPTMP_TODAY.LIST_NO AND CDL_STATUS_DETAIL_GPTMP.DETAIL_COUNT=CDL_STATUS_DETAIL_GPTMP_TODAY.DETAIL_COUNT ;
insert into CDL_STATUS_DETAIL_GPTMP_TODAY (CMD_TYPE,LIST_NO,DETAIL_COUNT,STATUS_NUMBER,STATUS_RESULT,STATUS_DETAIL) select CMD_TYPE,LIST_NO,DETAIL_COUNT,STATUS_NUMBER,STATUS_RESULT,STATUS_DETAIL from CDL_STATUS_DETAIL_INC_EXT;
delete from CDL_STATUS_DETAIL_GPTMP;
\timing