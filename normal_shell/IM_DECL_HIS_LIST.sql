\echo ------------------IM_DECL_HIS_LIST----------------
select now();
\timing
insert into IM_DECL_HIS_LIST_GPTMP (CMD_TYPE,PRE_NO, RECORD_NUMBER, G_NO) select CMD_TYPE,PRE_NO, RECORD_NUMBER, G_NO from IM_DECL_HIS_LIST_INC_EXT;

delete from IM_DECL_HIS_LIST using IM_DECL_HIS_LIST_GPTMP where IM_DECL_HIS_LIST_GPTMP.PRE_NO=IM_DECL_HIS_LIST.PRE_NO AND IM_DECL_HIS_LIST_GPTMP.RECORD_NUMBER=IM_DECL_HIS_LIST.RECORD_NUMBER AND IM_DECL_HIS_LIST_GPTMP.G_NO=IM_DECL_HIS_LIST.G_NO ;

insert into IM_DECL_HIS_LIST(PRE_NO,RECORD_NUMBER,TURN_NO,G_NO,CODE_TS,G_NAME,PACK_TYPE,GOODS_PIECE,GOODS_AMOUNT,GOODS_UNIT,GOODS_WEIGHT,GOODS_PRICE,GOODS_CURR,GOODS_CHK_MARK) select PRE_NO,RECORD_NUMBER,TURN_NO,G_NO,CODE_TS,G_NAME,PACK_TYPE,GOODS_PIECE,GOODS_AMOUNT,GOODS_UNIT,GOODS_WEIGHT,GOODS_PRICE,GOODS_CURR,GOODS_CHK_MARK from IM_DECL_HIS_LIST_INC_EXT where CMD_TYPE='I';

delete from IM_DECL_HIS_LIST_GPTMP;

\timing