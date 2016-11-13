\echo ------------------MNL_PARA----------------
select now();
\timing
delete from MNL_PARA_GPTMP;
insert into MNL_PARA_GPTMP (CMD_TYPE,PARA_TYPE, PARA_ID) select CMD_TYPE,PARA_TYPE, PARA_ID from MNL_PARA_INC_EXT;
delete from MNL_PARA_GPTMP_TODAY using MNL_PARA_GPTMP where MNL_PARA_GPTMP.PARA_TYPE=MNL_PARA_GPTMP_TODAY.PARA_TYPE AND MNL_PARA_GPTMP.PARA_ID=MNL_PARA_GPTMP_TODAY.PARA_ID ;
insert into MNL_PARA_GPTMP_TODAY (CMD_TYPE,PARA_TYPE,PARA_ID,PARA_NAME,PARA_EXP,PARA_FLAG,PARA_VALUE,PARA_MARK) select CMD_TYPE,PARA_TYPE,PARA_ID,PARA_NAME,PARA_EXP,PARA_FLAG,PARA_VALUE,PARA_MARK from MNL_PARA_INC_EXT;
delete from MNL_PARA_GPTMP;
\timing