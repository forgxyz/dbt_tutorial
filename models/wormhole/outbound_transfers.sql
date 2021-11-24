{{
    config(
        materialized="table"
    )
}}


SELECT
  block_timestamp,
  tx_id,
  event_attributes:"transfer.recipient_chain" as destination_chain_id,
  CASE
    WHEN event_attributes:"transfer.token"[0] IS NULL THEN 'UST' -- weird data cleaning going on w the flipside table
    ELSE 'LUNA'
  END as token,
  event_attributes:"transfer.amount" / pow(10,6) as amount,
  event_attributes
FROM FLIPSIDE.terra_sv.msg_events
WHERE block_timestamp > '2021-10-18T00:00:00Z'
  AND event_type = 'from_contract'
  AND event_attributes:"0_contract_address" = 'terra10nmmwe8r3g99a9newtqa7a75xfgs2e8z87r2sf'
  AND event_attributes:"1_contract_address" = 'terra1dq03ugtd40zu9hcgdzrsq6z2z4hwhc9tqk2uy5' -- separate out inbound from outbound
