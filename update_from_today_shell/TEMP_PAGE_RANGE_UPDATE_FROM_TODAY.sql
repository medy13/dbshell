\echo -----------------------TEMP_PAGE_RANGE------------------------
select now();
\timing
delete from TEMP_PAGE_RANGE using TEMP_PAGE_RANGE_GPTMP_TODAY where TEMP_PAGE_RANGE.PR_KEY=TEMP_PAGE_RANGE_GPTMP_TODAY.PR_KEY AND TEMP_PAGE_RANGE.PR_DETAIL=TEMP_PAGE_RANGE_GPTMP_TODAY.PR_DETAIL ;
insert into TEMP_PAGE_RANGE (PR_KEY,PR_DETAIL) select PR_KEY,PR_DETAIL from TEMP_PAGE_RANGE_GPTMP_TODAY  where CMD_TYPE='I';
\timing