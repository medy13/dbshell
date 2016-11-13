\echo ------------------IM_CONTRACT_DEDUC----------------
select now();
\timing
insert into IM_CONTRACT_DEDUC_GPTMP (CMD_TYPE,MANUAL_NO, ENTRY_ID, G_NO) select CMD_TYPE,MANUAL_NO, ENTRY_ID, G_NO from IM_CONTRACT_DEDUC_INC_EXT;

delete from IM_CONTRACT_DEDUC using IM_CONTRACT_DEDUC_GPTMP where IM_CONTRACT_DEDUC_GPTMP.MANUAL_NO=IM_CONTRACT_DEDUC.MANUAL_NO AND IM_CONTRACT_DEDUC_GPTMP.ENTRY_ID=IM_CONTRACT_DEDUC.ENTRY_ID AND IM_CONTRACT_DEDUC_GPTMP.G_NO=IM_CONTRACT_DEDUC.G_NO ;

insert into IM_CONTRACT_DEDUC(MANUAL_NO,CONTR_ITEM,ENTRY_ID,ENTRY_ITEM,I_E_PORT,I_E_DATE,G_NO,IN_QTY,I_ACCOUNT,I_CURR,DUTY_MODE,VERIFY_MODE,VERIFY_DATE,VERIFY_ER,DUTY_PRINT) select MANUAL_NO,CONTR_ITEM,ENTRY_ID,ENTRY_ITEM,I_E_PORT,I_E_DATE,G_NO,IN_QTY,I_ACCOUNT,I_CURR,DUTY_MODE,VERIFY_MODE,VERIFY_DATE,VERIFY_ER,DUTY_PRINT from IM_CONTRACT_DEDUC_INC_EXT where CMD_TYPE='I';

delete from IM_CONTRACT_DEDUC_GPTMP;

\timing