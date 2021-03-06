\echo ------------------HIS_TRN_COP_REL----------------
select now();
\timing
insert into HIS_TRN_COP_REL_GPTMP (CMD_TYPE,CO_REG_NO, MODI_COUNT) select CMD_TYPE,CO_REG_NO, MODI_COUNT from HIS_TRN_COP_REL_INC_EXT;

delete from HIS_TRN_COP_REL using HIS_TRN_COP_REL_GPTMP where HIS_TRN_COP_REL_GPTMP.CO_REG_NO=HIS_TRN_COP_REL.CO_REG_NO AND HIS_TRN_COP_REL_GPTMP.MODI_COUNT=HIS_TRN_COP_REL.MODI_COUNT ;

insert into HIS_TRN_COP_REL(CO_REG_NO,CO_CUSTOMS_NO,MAIN_PORT,CO_NAME,CO_ADDRESS,CO_PHONE_NO,VALID_FLAG,VALID_DATE,INPUT_DATE,INPUT_OP_ID,PERMIT_FLAG,PERMIT_DATE,PERMIT_OP_ID,MODI_OP_ID,MODI_TIME,MODI_COUNT,RESERV_FIELD,CO_REG_TYPE,CO_PROPERTY,CO_DEAL_RANGE,CO_AUTHORIZE_NO,CO_DEAL_DATE,CO_CORPORATION_REP,CO_ABROAD_NAME,GANG_AO_CARS,GANG_AO_CARS_USED,CK_FLAG,NOTE_FIELD) select CO_REG_NO,CO_CUSTOMS_NO,MAIN_PORT,CO_NAME,CO_ADDRESS,CO_PHONE_NO,VALID_FLAG,VALID_DATE,INPUT_DATE,INPUT_OP_ID,PERMIT_FLAG,PERMIT_DATE,PERMIT_OP_ID,MODI_OP_ID,MODI_TIME,MODI_COUNT,RESERV_FIELD,CO_REG_TYPE,CO_PROPERTY,CO_DEAL_RANGE,CO_AUTHORIZE_NO,CO_DEAL_DATE,CO_CORPORATION_REP,CO_ABROAD_NAME,GANG_AO_CARS,GANG_AO_CARS_USED,CK_FLAG,NOTE_FIELD from HIS_TRN_COP_REL_INC_EXT where CMD_TYPE='I';

delete from HIS_TRN_COP_REL_GPTMP;

\timing
