\echo ------------------CDL_OVERDUE_LIST----------------
select now();
\timing
insert into CDL_OVERDUE_LIST_GPTMP (CMD_TYPE,TRADE_CO, ENTRY_ID) select CMD_TYPE,TRADE_CO, ENTRY_ID from CDL_OVERDUE_LIST_INC_EXT;

delete from CDL_OVERDUE_LIST using CDL_OVERDUE_LIST_GPTMP where CDL_OVERDUE_LIST_GPTMP.TRADE_CO=CDL_OVERDUE_LIST.TRADE_CO AND CDL_OVERDUE_LIST_GPTMP.ENTRY_ID=CDL_OVERDUE_LIST.ENTRY_ID ;

insert into CDL_OVERDUE_LIST(TRADE_CO,TRADE_NAME,ENTRY_ID,TRADE_BONDED_FLAG,OVERDUE_DATE,OVERDUE_DAYS,OVERDUE_NOTES,CUSTOMS_CODE) select TRADE_CO,TRADE_NAME,ENTRY_ID,TRADE_BONDED_FLAG,OVERDUE_DATE,OVERDUE_DAYS,OVERDUE_NOTES,CUSTOMS_CODE from CDL_OVERDUE_LIST_INC_EXT where CMD_TYPE='I';

delete from CDL_OVERDUE_LIST_GPTMP;

\timing