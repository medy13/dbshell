\echo ------------------CTS_CHKRATE_LIMIT----------------
select now();
\timing
insert into CTS_CHKRATE_LIMIT_GPTMP (CMD_TYPE,ID) select CMD_TYPE,ID from CTS_CHKRATE_LIMIT_INC_EXT;

delete from CTS_CHKRATE_LIMIT using CTS_CHKRATE_LIMIT_GPTMP where CTS_CHKRATE_LIMIT_GPTMP.ID=CTS_CHKRATE_LIMIT.ID ;

insert into CTS_CHKRATE_LIMIT(ID,CUSTOMS_CODE,I_E_FLAG,MAX_CHK_RATE,MAX_OPEN_RATE,QUICK_CHK_RATE,QUICKUNI_CHK_RATE,UNI_CHK_RATE,UNI_NOCHK_RATE,RANDOM_RECHK_RATE,RANDOM_FOCUS_CHK_RATE) select ID,CUSTOMS_CODE,I_E_FLAG,MAX_CHK_RATE,MAX_OPEN_RATE,QUICK_CHK_RATE,QUICKUNI_CHK_RATE,UNI_CHK_RATE,UNI_NOCHK_RATE,RANDOM_RECHK_RATE,RANDOM_FOCUS_CHK_RATE from CTS_CHKRATE_LIMIT_INC_EXT where CMD_TYPE='I';

delete from CTS_CHKRATE_LIMIT_GPTMP;

\timing
