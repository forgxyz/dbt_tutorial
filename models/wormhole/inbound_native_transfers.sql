SELECT
  block_timestamp,
  event_attributes:denom as denom,
  event_attributes:amount / pow(10,6) as amount,
  event_attributes:recipient as recipient
FROM FLIPSIDE.terra_sv.msg_events
WHERE event_type = 'from_contract'
  AND event_attributes:action = 'complete_transfer_terra_native'
  AND event_attributes:contract_address = 'terra10nmmwe8r3g99a9newtqa7a75xfgs2e8z87r2sf'
  AND block_timestamp > '2021-10-18T00:00:00Z' 