/*
\echo ------------------BTI_DATA_HEAD----------------
select now();
\timing
delete from BTI_DATA_HEAD_GPTMP;
insert into BTI_DATA_HEAD_GPTMP (CMD_TYPE,UCR_CODE, CREATE_DATE) select CMD_TYPE,UCR_CODE, CREATE_DATE from BTI_DATA_HEAD_INC_EXT;
delete from BTI_DATA_HEAD_GPTMP_TODAY using BTI_DATA_HEAD_GPTMP where BTI_DATA_HEAD_GPTMP.UCR_CODE=BTI_DATA_HEAD_GPTMP_TODAY.UCR_CODE AND BTI_DATA_HEAD_GPTMP.CREATE_DATE=BTI_DATA_HEAD_GPTMP_TODAY.CREATE_DATE ;
insert into BTI_DATA_HEAD_GPTMP_TODAY (CMD_TYPE,UCR_CODE,ENTRY_ID,CREATE_DATE,OP_MODE,STATUS_CODE,I_E_FLAG,I_E_PORT,TRADE_CO,TRADE_NAME,TRAF_NAME,VOYAGE_NO,BILL_NO,OUT_PORT_DATE,TRADE_PORT,PACK_NO,REL_DATE,HASH_SIGN,CUSTOMS_REMARK,CONSIGNOR_NAME,DESTINATION_PORT,SEND_DATE) select CMD_TYPE,UCR_CODE,ENTRY_ID,CREATE_DATE,OP_MODE,STATUS_CODE,I_E_FLAG,I_E_PORT,TRADE_CO,TRADE_NAME,TRAF_NAME,VOYAGE_NO,BILL_NO,OUT_PORT_DATE,TRADE_PORT,PACK_NO,REL_DATE,HASH_SIGN,CUSTOMS_REMARK,CONSIGNOR_NAME,DESTINATION_PORT,SEND_DATE from BTI_DATA_HEAD_INC_EXT;
delete from BTI_DATA_HEAD_GPTMP;
\timing
*/
