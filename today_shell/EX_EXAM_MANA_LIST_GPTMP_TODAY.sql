\echo ------------------EX_EXAM_MANA_LIST----------------
select now();
\timing
delete from EX_EXAM_MANA_LIST_GPTMP;
insert into EX_EXAM_MANA_LIST_GPTMP (CMD_TYPE,LICENSE_NO, L_G_NO) select CMD_TYPE,LICENSE_NO, L_G_NO from EX_EXAM_MANA_LIST_INC_EXT;
delete from EX_EXAM_MANA_LIST_GPTMP_TODAY using EX_EXAM_MANA_LIST_GPTMP where EX_EXAM_MANA_LIST_GPTMP.LICENSE_NO=EX_EXAM_MANA_LIST_GPTMP_TODAY.LICENSE_NO AND EX_EXAM_MANA_LIST_GPTMP.L_G_NO=EX_EXAM_MANA_LIST_GPTMP_TODAY.L_G_NO ;
insert into EX_EXAM_MANA_LIST_GPTMP_TODAY (CMD_TYPE,LICENSE_NO,L_G_NO,L_FACT_AQTY,L_FACT_AUSED,L_REUSE1,L_REUSE2) select CMD_TYPE,LICENSE_NO,L_G_NO,L_FACT_AQTY,L_FACT_AUSED,L_REUSE1,L_REUSE2 from EX_EXAM_MANA_LIST_INC_EXT;
delete from EX_EXAM_MANA_LIST_GPTMP;
\timing
