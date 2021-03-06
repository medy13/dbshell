\echo ------------------DISTRIBUTIVE_BILL_DECLARE----------------
select now();
\timing
delete from DISTRIBUTIVE_BILL_DECLARE_GPTMP;
insert into DISTRIBUTIVE_BILL_DECLARE_GPTMP (CMD_TYPE,DISTRIBUTIVE_NO, I_E_FLAG, CUSTOMS_CODE, TRAF_MODE, VOYAGE_NO, BILL_NO, SHIP_ID, I_E_DATE) select CMD_TYPE,DISTRIBUTIVE_NO, I_E_FLAG, CUSTOMS_CODE, TRAF_MODE, VOYAGE_NO, BILL_NO, SHIP_ID, I_E_DATE from DISTRIBUTIVE_BILL_DECLARE_INC_EXT;
delete from DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY using DISTRIBUTIVE_BILL_DECLARE_GPTMP where DISTRIBUTIVE_BILL_DECLARE_GPTMP.DISTRIBUTIVE_NO=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.DISTRIBUTIVE_NO AND DISTRIBUTIVE_BILL_DECLARE_GPTMP.I_E_FLAG=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.I_E_FLAG AND DISTRIBUTIVE_BILL_DECLARE_GPTMP.CUSTOMS_CODE=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.CUSTOMS_CODE AND DISTRIBUTIVE_BILL_DECLARE_GPTMP.TRAF_MODE=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.TRAF_MODE AND DISTRIBUTIVE_BILL_DECLARE_GPTMP.VOYAGE_NO=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.VOYAGE_NO AND DISTRIBUTIVE_BILL_DECLARE_GPTMP.BILL_NO=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.BILL_NO AND DISTRIBUTIVE_BILL_DECLARE_GPTMP.SHIP_ID=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.SHIP_ID AND DISTRIBUTIVE_BILL_DECLARE_GPTMP.I_E_DATE=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.I_E_DATE ;
insert into DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY (CMD_TYPE,DISTRIBUTIVE_NO,I_E_FLAG,CUSTOMS_CODE,TRAF_MODE,VOYAGE_NO,BILL_NO,SHIP_ID,I_E_DATE,DISTRIBUTIVE_MARK,PACK_NO,GROSS_WT,VOLUME) select CMD_TYPE,DISTRIBUTIVE_NO,I_E_FLAG,CUSTOMS_CODE,TRAF_MODE,VOYAGE_NO,BILL_NO,SHIP_ID,I_E_DATE,DISTRIBUTIVE_MARK,PACK_NO,GROSS_WT,VOLUME from DISTRIBUTIVE_BILL_DECLARE_INC_EXT;
delete from DISTRIBUTIVE_BILL_DECLARE_GPTMP;
\timing
