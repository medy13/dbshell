\echo -----------------------IM_DECL_CUR_LIST------------------------
select now();
\timing
delete from IM_DECL_CUR_LIST using IM_DECL_CUR_LIST_GPTMP_TODAY where IM_DECL_CUR_LIST.PRE_NO=IM_DECL_CUR_LIST_GPTMP_TODAY.PRE_NO AND IM_DECL_CUR_LIST.RECORD_NUMBER=IM_DECL_CUR_LIST_GPTMP_TODAY.RECORD_NUMBER AND IM_DECL_CUR_LIST.G_NO=IM_DECL_CUR_LIST_GPTMP_TODAY.G_NO ;
insert into IM_DECL_CUR_LIST (PRE_NO,RECORD_NUMBER,TURN_NO,G_NO,CODE_TS,G_NAME,PACK_TYPE,GOODS_PIECE,GOODS_AMOUNT,GOODS_UNIT,GOODS_WEIGHT,GOODS_PRICE,GOODS_CURR,GOODS_CHK_MARK,SEND_PORT,RECV_PORT) select PRE_NO,RECORD_NUMBER,TURN_NO,G_NO,CODE_TS,G_NAME,PACK_TYPE,GOODS_PIECE,GOODS_AMOUNT,GOODS_UNIT,GOODS_WEIGHT,GOODS_PRICE,GOODS_CURR,GOODS_CHK_MARK,SEND_PORT,RECV_PORT from IM_DECL_CUR_LIST_GPTMP_TODAY  where CMD_TYPE='I';
\timing