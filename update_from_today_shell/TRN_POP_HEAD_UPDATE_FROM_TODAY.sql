\echo -----------------------TRN_POP_HEAD------------------------
select now();
\timing
delete from TRN_POP_HEAD using TRN_POP_HEAD_GPTMP_TODAY where TRN_POP_HEAD.APPLY_NO=TRN_POP_HEAD_GPTMP_TODAY.APPLY_NO ;
insert into TRN_POP_HEAD (APPLY_NO,CUSTOMS_CODE,APPLY_MODE,I_E_FLAG,INPUT_OP_ID,INPUT_DATE,DECL_CO,TRANS_PRE_NO,EXAM_OP_ID,EXAM_TIME,EXAM_MARK,REJECT_REASON,PRE_NO_NEW,APPL_NAME,APPL_CODE,CONTRACTOR,CONTRACTOR_CODE,TRAF_WAY,CUSTOMS_NO,TRANS_NO,NATIVE_VOYAGE_NO,BILL_COUNT,CONTA_AMOUNT,CONTA_INI_COUNT,CONTA_EMPTY_COUNT,ESEAL_FLAG,RECV_PORT,MFT_GOODS_PIECE,MFT_GROSS_WEIGHT,TRN_MODE,NOTE) select APPLY_NO,CUSTOMS_CODE,APPLY_MODE,I_E_FLAG,INPUT_OP_ID,INPUT_DATE,DECL_CO,TRANS_PRE_NO,EXAM_OP_ID,EXAM_TIME,EXAM_MARK,REJECT_REASON,PRE_NO_NEW,APPL_NAME,APPL_CODE,CONTRACTOR,CONTRACTOR_CODE,TRAF_WAY,CUSTOMS_NO,TRANS_NO,NATIVE_VOYAGE_NO,BILL_COUNT,CONTA_AMOUNT,CONTA_INI_COUNT,CONTA_EMPTY_COUNT,ESEAL_FLAG,RECV_PORT,MFT_GOODS_PIECE,MFT_GROSS_WEIGHT,TRN_MODE,NOTE from TRN_POP_HEAD_GPTMP_TODAY  where CMD_TYPE='I';
\timing