\echo ------------------APPLY_LIST----------------
select now();
\timing
insert into APPLY_LIST_GPTMP (CMD_TYPE,APPL_NO, G_NO) select CMD_TYPE,APPL_NO, G_NO from APPLY_LIST_INC_EXT;

delete from APPLY_LIST using APPLY_LIST_GPTMP where APPLY_LIST_GPTMP.APPL_NO=APPLY_LIST.APPL_NO AND APPLY_LIST_GPTMP.G_NO=APPLY_LIST.G_NO ;

insert into APPLY_LIST(APPL_NO,CONTACT_NO,G_NO,CODE_TS,G_NAME,PACK_TYPE,GOODS_PIECE,GOODS_AMOUNT,GOODS_WEIGHT,GOODS_PRICE) select APPL_NO,CONTACT_NO,G_NO,CODE_TS,G_NAME,PACK_TYPE,GOODS_PIECE,GOODS_AMOUNT,GOODS_WEIGHT,GOODS_PRICE from APPLY_LIST_INC_EXT where CMD_TYPE='I';

delete from APPLY_LIST_GPTMP;

\timing