\echo -----------------------OCC_RECEIPT------------------------
select now();
\timing
delete from OCC_RECEIPT using OCC_RECEIPT_GPTMP_TODAY where OCC_RECEIPT.CERTIFICATE_NO=OCC_RECEIPT_GPTMP_TODAY.CERTIFICATE_NO AND OCC_RECEIPT.AGREEMENT_ID=OCC_RECEIPT_GPTMP_TODAY.AGREEMENT_ID AND OCC_RECEIPT.ISSUE_PLACE=OCC_RECEIPT_GPTMP_TODAY.ISSUE_PLACE ;
insert into OCC_RECEIPT (CERTIFICATE_NO,AGREEMENT_ID,ISSUE_PLACE,RETURN_DATE,MESSAGE_ID,STEP_ID) select CERTIFICATE_NO,AGREEMENT_ID,ISSUE_PLACE,RETURN_DATE,MESSAGE_ID,STEP_ID from OCC_RECEIPT_GPTMP_TODAY  where CMD_TYPE='I';
\timing