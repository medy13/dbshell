\echo -----------------------DISTRIBUTIVE_BILL_DECLARE------------------------
select now();
\timing
delete from DISTRIBUTIVE_BILL_DECLARE using DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY where DISTRIBUTIVE_BILL_DECLARE.DISTRIBUTIVE_NO=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.DISTRIBUTIVE_NO AND DISTRIBUTIVE_BILL_DECLARE.I_E_FLAG=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.I_E_FLAG AND DISTRIBUTIVE_BILL_DECLARE.CUSTOMS_CODE=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.CUSTOMS_CODE AND DISTRIBUTIVE_BILL_DECLARE.TRAF_MODE=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.TRAF_MODE AND DISTRIBUTIVE_BILL_DECLARE.VOYAGE_NO=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.VOYAGE_NO AND DISTRIBUTIVE_BILL_DECLARE.BILL_NO=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.BILL_NO AND DISTRIBUTIVE_BILL_DECLARE.SHIP_ID=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.SHIP_ID AND DISTRIBUTIVE_BILL_DECLARE.I_E_DATE=DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY.I_E_DATE ;
insert into DISTRIBUTIVE_BILL_DECLARE (DISTRIBUTIVE_NO,I_E_FLAG,CUSTOMS_CODE,TRAF_MODE,VOYAGE_NO,BILL_NO,SHIP_ID,I_E_DATE,DISTRIBUTIVE_MARK,PACK_NO,GROSS_WT,VOLUME) select DISTRIBUTIVE_NO,I_E_FLAG,CUSTOMS_CODE,TRAF_MODE,VOYAGE_NO,BILL_NO,SHIP_ID,I_E_DATE,DISTRIBUTIVE_MARK,PACK_NO,GROSS_WT,VOLUME from DISTRIBUTIVE_BILL_DECLARE_GPTMP_TODAY  where CMD_TYPE='I';
\timing