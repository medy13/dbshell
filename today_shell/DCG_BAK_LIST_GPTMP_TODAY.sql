\echo ------------------DCG_BAK_LIST----------------
select now();
\timing
delete from DCG_BAK_LIST_GPTMP;
insert into DCG_BAK_LIST_GPTMP (CMD_TYPE,DCG_NO) select CMD_TYPE,DCG_NO from DCG_BAK_LIST_INC_EXT;
delete from DCG_BAK_LIST_GPTMP_TODAY using DCG_BAK_LIST_GPTMP where DCG_BAK_LIST_GPTMP.DCG_NO=DCG_BAK_LIST_GPTMP_TODAY.DCG_NO ;
insert into DCG_BAK_LIST_GPTMP_TODAY (CMD_TYPE,DCG_NO,CREATE_DATE) select CMD_TYPE,DCG_NO,CREATE_DATE from DCG_BAK_LIST_INC_EXT;
delete from DCG_BAK_LIST_GPTMP;
\timing