\echo ------------------FCB_LIST----------------
select now();
\timing
delete from FCB_LIST_GPTMP;
insert into FCB_LIST_GPTMP (CMD_TYPE,FCB_ID, G_NO) select CMD_TYPE,FCB_ID, G_NO from FCB_LIST_INC_EXT;
delete from FCB_LIST_GPTMP_TODAY using FCB_LIST_GPTMP where FCB_LIST_GPTMP.FCB_ID=FCB_LIST_GPTMP_TODAY.FCB_ID AND FCB_LIST_GPTMP.G_NO=FCB_LIST_GPTMP_TODAY.G_NO ;
insert into FCB_LIST_GPTMP_TODAY (CMD_TYPE,FCB_ID,G_NO,CODE_TS,G_NAME,WRAP_TYPE,PACK_NO,GROSS_WT,PRICE,CURR,MARK,CONSIGNOR,CONSIGNEE,UCR,UNDG,FREE_TEXT,PORT_CUS,MAIN_CUS,BILL_NO) select CMD_TYPE,FCB_ID,G_NO,CODE_TS,G_NAME,WRAP_TYPE,PACK_NO,GROSS_WT,PRICE,CURR,MARK,CONSIGNOR,CONSIGNEE,UCR,UNDG,FREE_TEXT,PORT_CUS,MAIN_CUS,BILL_NO from FCB_LIST_INC_EXT;
delete from FCB_LIST_GPTMP;
\timing
