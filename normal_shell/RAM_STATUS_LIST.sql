\echo ------------------RAM_STATUS_LIST----------------
select now();
\timing
insert into RAM_STATUS_LIST_GPTMP (CMD_TYPE,CUT_ID, G_NO) select CMD_TYPE,CUT_ID, G_NO from RAM_STATUS_LIST_INC_EXT;

delete from RAM_STATUS_LIST using RAM_STATUS_LIST_GPTMP where RAM_STATUS_LIST_GPTMP.CUT_ID=RAM_STATUS_LIST.CUT_ID AND RAM_STATUS_LIST_GPTMP.G_NO=RAM_STATUS_LIST.G_NO ;

insert into RAM_STATUS_LIST(CUT_ID,G_NO,RJ_QTY,RT_QTY,RT_QTY_DONE,RD_QTY,RD_QTY_DONE,RY_QTY,RY_QTY_DONE,RZ_QTY,RZ_QTY_DONE,RB_QTY,RB_QTY_DONE,RYE_QTY,RYE_QTY_DONE,RESERVE1,NOTE) select CUT_ID,G_NO,RJ_QTY,RT_QTY,RT_QTY_DONE,RD_QTY,RD_QTY_DONE,RY_QTY,RY_QTY_DONE,RZ_QTY,RZ_QTY_DONE,RB_QTY,RB_QTY_DONE,RYE_QTY,RYE_QTY_DONE,RESERVE1,NOTE from RAM_STATUS_LIST_INC_EXT where CMD_TYPE='I';

delete from RAM_STATUS_LIST_GPTMP;

\timing
