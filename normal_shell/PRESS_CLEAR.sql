\echo ------------------PRESS_CLEAR----------------
select now();
\timing
insert into PRESS_CLEAR_GPTMP (CMD_TYPE,MANUAL_NO, PR_NO) select CMD_TYPE,MANUAL_NO, PR_NO from PRESS_CLEAR_INC_EXT;

delete from PRESS_CLEAR using PRESS_CLEAR_GPTMP where PRESS_CLEAR_GPTMP.MANUAL_NO=PRESS_CLEAR.MANUAL_NO AND PRESS_CLEAR_GPTMP.PR_NO=PRESS_CLEAR.PR_NO ;

insert into PRESS_CLEAR(MANUAL_NO,PR_NO,PR_COUNT,PR_CUSTOMS,PR_DEPARTMENT,PR_DATE) select MANUAL_NO,PR_NO,PR_COUNT,PR_CUSTOMS,PR_DEPARTMENT,PR_DATE from PRESS_CLEAR_INC_EXT where CMD_TYPE='I';

delete from PRESS_CLEAR_GPTMP;

\timing