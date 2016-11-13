\echo ------------------CHK_RATE_LIMIT----------------
select now();
\timing
insert into CHK_RATE_LIMIT_GPTMP (CMD_TYPE,CUSTOMS_CODE, I_E_FLAG) select CMD_TYPE,CUSTOMS_CODE, I_E_FLAG from CHK_RATE_LIMIT_INC_EXT;

delete from CHK_RATE_LIMIT using CHK_RATE_LIMIT_GPTMP where CHK_RATE_LIMIT_GPTMP.CUSTOMS_CODE=CHK_RATE_LIMIT.CUSTOMS_CODE AND CHK_RATE_LIMIT_GPTMP.I_E_FLAG=CHK_RATE_LIMIT.I_E_FLAG ;

insert into CHK_RATE_LIMIT(CUSTOMS_CODE,I_E_FLAG,MAX_CHK_RATE,MAX_OPEN_RATE,RANDOM_CHK_RATE) select CUSTOMS_CODE,I_E_FLAG,MAX_CHK_RATE,MAX_OPEN_RATE,RANDOM_CHK_RATE from CHK_RATE_LIMIT_INC_EXT where CMD_TYPE='I';

delete from CHK_RATE_LIMIT_GPTMP;

\timing