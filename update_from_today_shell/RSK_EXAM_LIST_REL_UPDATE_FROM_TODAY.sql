\echo -----------------------RSK_EXAM_LIST_REL------------------------
select now();
\timing
delete from RSK_EXAM_LIST_REL using RSK_EXAM_LIST_REL_GPTMP_TODAY where RSK_EXAM_LIST_REL.EXAM_REC_ID=RSK_EXAM_LIST_REL_GPTMP_TODAY.EXAM_REC_ID AND RSK_EXAM_LIST_REL.G_NO=RSK_EXAM_LIST_REL_GPTMP_TODAY.G_NO ;
insert into RSK_EXAM_LIST_REL (EXAM_REC_ID,G_NO,CODE_TS,G_NAME,G_MODEL,ORIGIN_COUNTRY,QTY_1,G_UNIT,DECL_PRICE,TRADE_CURR,TRADE_TOTAL,REAL_CODE_TS,REAL_G_NAME,REAL_G_MODEL,REAL_ORIGIN_COUNTRY,REAL_QTY_1,REAL_TRADE_TOTAL,REAL_G_UNIT,REAL_TRADE_CURR,EXAM_RESULT,EXAM_MODE_CODE,CODE_TS_RESULT,G_NAME_RESULT,G_MODEL_RESULT,ORIGIN_COUNTRY_RESULT,QTY_1_RESULT,G_UNIT_RESULT,DECL_PRICE_RESULT,TRADE_CURR_RESULT,EXAM_MODE_CODE_RESULT) select EXAM_REC_ID,G_NO,CODE_TS,G_NAME,G_MODEL,ORIGIN_COUNTRY,QTY_1,G_UNIT,DECL_PRICE,TRADE_CURR,TRADE_TOTAL,REAL_CODE_TS,REAL_G_NAME,REAL_G_MODEL,REAL_ORIGIN_COUNTRY,REAL_QTY_1,REAL_TRADE_TOTAL,REAL_G_UNIT,REAL_TRADE_CURR,EXAM_RESULT,EXAM_MODE_CODE,CODE_TS_RESULT,G_NAME_RESULT,G_MODEL_RESULT,ORIGIN_COUNTRY_RESULT,QTY_1_RESULT,G_UNIT_RESULT,DECL_PRICE_RESULT,TRADE_CURR_RESULT,EXAM_MODE_CODE_RESULT from RSK_EXAM_LIST_REL_GPTMP_TODAY  where CMD_TYPE='I';
\timing