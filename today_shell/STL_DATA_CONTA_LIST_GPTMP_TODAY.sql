\echo ------------------STL_DATA_CONTA_LIST----------------
select now();
\timing
delete from STL_DATA_CONTA_LIST_GPTMP;
insert into STL_DATA_CONTA_LIST_GPTMP (CMD_TYPE,UCR_CODE, CONTAINER_ID) select CMD_TYPE,UCR_CODE, CONTAINER_ID from STL_DATA_CONTA_LIST_INC_EXT;
delete from STL_DATA_CONTA_LIST_GPTMP_TODAY using STL_DATA_CONTA_LIST_GPTMP where STL_DATA_CONTA_LIST_GPTMP.UCR_CODE=STL_DATA_CONTA_LIST_GPTMP_TODAY.UCR_CODE AND STL_DATA_CONTA_LIST_GPTMP.CONTAINER_ID=STL_DATA_CONTA_LIST_GPTMP_TODAY.CONTAINER_ID ;
insert into STL_DATA_CONTA_LIST_GPTMP_TODAY (CMD_TYPE,UCR_CODE,CONTAINER_ID,SEAL_NO) select CMD_TYPE,UCR_CODE,CONTAINER_ID,SEAL_NO from STL_DATA_CONTA_LIST_INC_EXT;
delete from STL_DATA_CONTA_LIST_GPTMP;
\timing
