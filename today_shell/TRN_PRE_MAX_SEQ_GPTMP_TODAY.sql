\echo ------------------TRN_PRE_MAX_SEQ----------------
select now();
\timing
delete from TRN_PRE_MAX_SEQ_GPTMP;
insert into TRN_PRE_MAX_SEQ_GPTMP (CMD_TYPE,TYPE, YEARAREA) select CMD_TYPE,TYPE, YEARAREA from TRN_PRE_MAX_SEQ_INC_EXT;
delete from TRN_PRE_MAX_SEQ_GPTMP_TODAY using TRN_PRE_MAX_SEQ_GPTMP where TRN_PRE_MAX_SEQ_GPTMP.TYPE=TRN_PRE_MAX_SEQ_GPTMP_TODAY.TYPE AND TRN_PRE_MAX_SEQ_GPTMP.YEARAREA=TRN_PRE_MAX_SEQ_GPTMP_TODAY.YEARAREA ;
insert into TRN_PRE_MAX_SEQ_GPTMP_TODAY (CMD_TYPE,TYPE,YEARAREA,MAX_SEQ) select CMD_TYPE,TYPE,YEARAREA,MAX_SEQ from TRN_PRE_MAX_SEQ_INC_EXT;
delete from TRN_PRE_MAX_SEQ_GPTMP;
\timing
