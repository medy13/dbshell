\echo -----------------------CDL_OVERDUE_LIST------------------------
select now();
\timing
delete from CDL_OVERDUE_LIST using CDL_OVERDUE_LIST_GPTMP_TODAY where CDL_OVERDUE_LIST.TRADE_CO=CDL_OVERDUE_LIST_GPTMP_TODAY.TRADE_CO AND CDL_OVERDUE_LIST.ENTRY_ID=CDL_OVERDUE_LIST_GPTMP_TODAY.ENTRY_ID ;
insert into CDL_OVERDUE_LIST (TRADE_CO,TRADE_NAME,ENTRY_ID,TRADE_BONDED_FLAG,OVERDUE_DATE,OVERDUE_DAYS,OVERDUE_NOTES,CUSTOMS_CODE) select TRADE_CO,TRADE_NAME,ENTRY_ID,TRADE_BONDED_FLAG,OVERDUE_DATE,OVERDUE_DAYS,OVERDUE_NOTES,CUSTOMS_CODE from CDL_OVERDUE_LIST_GPTMP_TODAY  where CMD_TYPE='I';
\timing