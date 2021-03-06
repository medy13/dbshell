\echo ------------------CONSUME_GOODS----------------
select now();
\timing
insert into CONSUME_GOODS_GPTMP (CMD_TYPE,CODE_TS, G_NO, G_FLAG) select CMD_TYPE,CODE_TS, G_NO, G_FLAG from CONSUME_GOODS_INC_EXT;

delete from CONSUME_GOODS using CONSUME_GOODS_GPTMP where CONSUME_GOODS_GPTMP.CODE_TS=CONSUME_GOODS.CODE_TS AND CONSUME_GOODS_GPTMP.G_NO=CONSUME_GOODS.G_NO AND CONSUME_GOODS_GPTMP.G_FLAG=CONSUME_GOODS.G_FLAG ;

insert into CONSUME_GOODS(CODE_TS,G_NO,G_FLAG,G_NAME,G_MODEL,UNIT_1,TRADE_COUNTRY,INFO_SOURCE,INPUT_DATE,NOTE_S) select CODE_TS,G_NO,G_FLAG,G_NAME,G_MODEL,UNIT_1,TRADE_COUNTRY,INFO_SOURCE,INPUT_DATE,NOTE_S from CONSUME_GOODS_INC_EXT where CMD_TYPE='I';

delete from CONSUME_GOODS_GPTMP;

\timing
