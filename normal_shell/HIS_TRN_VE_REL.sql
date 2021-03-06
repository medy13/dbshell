\echo ------------------HIS_TRN_VE_REL----------------
select now();
\timing
insert into HIS_TRN_VE_REL_GPTMP (CMD_TYPE,VE_CUSTOMS_NO, MODI_COUNT) select CMD_TYPE,VE_CUSTOMS_NO, MODI_COUNT from HIS_TRN_VE_REL_INC_EXT;

delete from HIS_TRN_VE_REL using HIS_TRN_VE_REL_GPTMP where HIS_TRN_VE_REL_GPTMP.VE_CUSTOMS_NO=HIS_TRN_VE_REL.VE_CUSTOMS_NO AND HIS_TRN_VE_REL_GPTMP.MODI_COUNT=HIS_TRN_VE_REL.MODI_COUNT ;

insert into HIS_TRN_VE_REL(VE_CUSTOMS_NO,CAR_EC_NO,VE_TYPE,MAIN_PORT,VE_NAME,CO_REG_NO,CO_NAME,CK_FLAG,VALID_FLAG,VALID_DATE,INPUT_DATE,INPUT_OP_ID,MODI_OP_ID,MODI_TIME,MODI_COUNT,RESERV_FIELD,VE_WT,REG_TYPE,VE_NO1,VE_BELONG_AREA,VE_PROPERTY,VE_BRAND,VE_OILTANK_VOL,VE_INDEX_NO,VE_IE_CERF_NO,VE_COLOR,VE_MOTOR_NO,VE_FRAME_NO,VE_TON,NOTE_FIELD,VE_IE_PORT,GPS_ID,SIM_1,SIM_2,GPS_PROVIDER,GPS_FLAG,TRANS_NO) select VE_CUSTOMS_NO,CAR_EC_NO,VE_TYPE,MAIN_PORT,VE_NAME,CO_REG_NO,CO_NAME,CK_FLAG,VALID_FLAG,VALID_DATE,INPUT_DATE,INPUT_OP_ID,MODI_OP_ID,MODI_TIME,MODI_COUNT,RESERV_FIELD,VE_WT,REG_TYPE,VE_NO1,VE_BELONG_AREA,VE_PROPERTY,VE_BRAND,VE_OILTANK_VOL,VE_INDEX_NO,VE_IE_CERF_NO,VE_COLOR,VE_MOTOR_NO,VE_FRAME_NO,VE_TON,NOTE_FIELD,VE_IE_PORT,GPS_ID,SIM_1,SIM_2,GPS_PROVIDER,GPS_FLAG,TRANS_NO from HIS_TRN_VE_REL_INC_EXT where CMD_TYPE='I';

delete from HIS_TRN_VE_REL_GPTMP;

\timing
