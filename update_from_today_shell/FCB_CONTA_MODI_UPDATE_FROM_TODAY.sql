\echo -----------------------FCB_CONTA_MODI------------------------
select now();
\timing
delete from FCB_CONTA_MODI using FCB_CONTA_MODI_GPTMP_TODAY where FCB_CONTA_MODI.FCB_ID=FCB_CONTA_MODI_GPTMP_TODAY.FCB_ID AND FCB_CONTA_MODI.CONTA_ID=FCB_CONTA_MODI_GPTMP_TODAY.CONTA_ID ;
insert into FCB_CONTA_MODI (FCB_ID,CONTA_ID,ESEAL_ID,CONTA_MODEL,CONTA_TYPE,DE_CONSOLIDATOR,CONTA_WT,NOTE) select FCB_ID,CONTA_ID,ESEAL_ID,CONTA_MODEL,CONTA_TYPE,DE_CONSOLIDATOR,CONTA_WT,NOTE from FCB_CONTA_MODI_GPTMP_TODAY  where CMD_TYPE='I';
\timing