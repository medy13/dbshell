\echo ------------------TRN_VEHICLE----------------
select now();
\timing
insert into TRN_VEHICLE_GPTMP (CMD_TYPE,CUSTOM_NO) select CMD_TYPE,CUSTOM_NO from TRN_VEHICLE_INC_EXT;

delete from TRN_VEHICLE using TRN_VEHICLE_GPTMP where TRN_VEHICLE_GPTMP.CUSTOM_NO=TRN_VEHICLE.CUSTOM_NO ;

insert into TRN_VEHICLE(CUSTOM_NO,VALID_FLAG,CK_FLAG,MAN_CUSTOM_NO,DR_NAME,DR_SFZ,CO_NAME,CAR_NO,CAR_EC_NO,VALID_DATE,OPERATOR_NO,INPUT_DATE,CO_ADDRESS,CO_TELE,CO_MAIL,TRAF_FLAG,TRAF_NOTE) select CUSTOM_NO,VALID_FLAG,CK_FLAG,MAN_CUSTOM_NO,DR_NAME,DR_SFZ,CO_NAME,CAR_NO,CAR_EC_NO,VALID_DATE,OPERATOR_NO,INPUT_DATE,CO_ADDRESS,CO_TELE,CO_MAIL,TRAF_FLAG,TRAF_NOTE from TRN_VEHICLE_INC_EXT where CMD_TYPE='I';

delete from TRN_VEHICLE_GPTMP;

\timing
