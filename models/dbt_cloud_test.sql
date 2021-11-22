{{
    config(
        materialized="table"
    )
}}

-- anchor yield reserve query
SELECT
  date,
  sum(balance) as reserve
FROM FLIPSIDE.terra.daily_balances
WHERE address = 'terra1tmnqgvg567ypvsvk6rwsga3srp7e3lg6u0elp8'
  AND currency = 'UST'
  AND date > '2021-07-13T00:00:00Z'
GROUP BY 1