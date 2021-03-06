\echo ------------------TRN_DR_REL----------------
select now();
\timing
insert into TRN_DR_REL_GPTMP (CMD_TYPE,DR_CUSTOMS_NO) select CMD_TYPE,DR_CUSTOMS_NO from TRN_DR_REL_INC_EXT;

delete from TRN_DR_REL using TRN_DR_REL_GPTMP where TRN_DR_REL_GPTMP.DR_CUSTOMS_NO=TRN_DR_REL.DR_CUSTOMS_NO ;

insert into TRN_DR_REL(DR_REG_TYPE,DR_CUSTOMS_NO,DR_IC_NO,DR_NAME,DR_IDCARD_NO,DR_GENDER,DR_NATIVE,DR_BIRTH_DATE,CO_REG_NO,CO_NAME,MAIN_PORT,DR_LIC_CUS,DR_IE_CERF_NO,DR_PERMIT_VE,VALID_FLAG,CK_FLAG,VALID_DATE,TRAIN_VALID_DATE,INPUT_DATE,INPUT_OP_ID,RESERV_FIELD,NOTE_FIELD,DR_IC_NO2) select DR_REG_TYPE,DR_CUSTOMS_NO,DR_IC_NO,DR_NAME,DR_IDCARD_NO,DR_GENDER,DR_NATIVE,DR_BIRTH_DATE,CO_REG_NO,CO_NAME,MAIN_PORT,DR_LIC_CUS,DR_IE_CERF_NO,DR_PERMIT_VE,VALID_FLAG,CK_FLAG,VALID_DATE,TRAIN_VALID_DATE,INPUT_DATE,INPUT_OP_ID,RESERV_FIELD,NOTE_FIELD,DR_IC_NO2 from TRN_DR_REL_INC_EXT where CMD_TYPE='I';

delete from TRN_DR_REL_GPTMP;

\timing
