\echo -----------------------MNLBAK_SERVICE_FEE------------------------
select now();
\timing
delete from MNLBAK_SERVICE_FEE using MNLBAK_SERVICE_FEE_GPTMP_TODAY where MNLBAK_SERVICE_FEE.MANUAL_NO=MNLBAK_SERVICE_FEE_GPTMP_TODAY.MANUAL_NO ;
insert into MNLBAK_SERVICE_FEE (MANUAL_NO,DUE_FEE_AMT,PAY_FEE_AMT,CREATE_DATE,RETURN_ID,RETURN_FLAG,REMAIN_AMT) select MANUAL_NO,DUE_FEE_AMT,PAY_FEE_AMT,CREATE_DATE,RETURN_ID,RETURN_FLAG,REMAIN_AMT from MNLBAK_SERVICE_FEE_GPTMP_TODAY  where CMD_TYPE='I';
\timing
