\echo ------------------TRN_CHK_GOODS----------------
select now();
\timing
insert into TRN_CHK_GOODS_GPTMP (CMD_TYPE,CHK_CODE_TS) select CMD_TYPE,CHK_CODE_TS from TRN_CHK_GOODS_INC_EXT;

delete from TRN_CHK_GOODS using TRN_CHK_GOODS_GPTMP where TRN_CHK_GOODS_GPTMP.CHK_CODE_TS=TRN_CHK_GOODS.CHK_CODE_TS ;

insert into TRN_CHK_GOODS(CHK_CODE_TS,CHK_G_NAME,USE_1,USE_2,USE_3) select CHK_CODE_TS,CHK_G_NAME,USE_1,USE_2,USE_3 from TRN_CHK_GOODS_INC_EXT where CMD_TYPE='I';

delete from TRN_CHK_GOODS_GPTMP;

\timing
