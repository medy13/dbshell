\echo -----------------------MNLBAK_PRESS_CLEAR------------------------
select now();
\timing
delete from MNLBAK_PRESS_CLEAR using MNLBAK_PRESS_CLEAR_GPTMP_TODAY where MNLBAK_PRESS_CLEAR.MANUAL_NO=MNLBAK_PRESS_CLEAR_GPTMP_TODAY.MANUAL_NO AND MNLBAK_PRESS_CLEAR.PR_NO=MNLBAK_PRESS_CLEAR_GPTMP_TODAY.PR_NO ;
insert into MNLBAK_PRESS_CLEAR (MANUAL_NO,PR_NO,PR_COUNT,PR_CUSTOMS,PR_DEPARTMENT,PR_DATE) select MANUAL_NO,PR_NO,PR_COUNT,PR_CUSTOMS,PR_DEPARTMENT,PR_DATE from MNLBAK_PRESS_CLEAR_GPTMP_TODAY  where CMD_TYPE='I';
\timing