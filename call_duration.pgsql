SELECT
     call.callerx
    ,call.receivery
    ,sum(call.duration) as conversation
FROM(
    select
    *
    ,CASE WHEN c.caller>c.receiver THEN c.caller 
          WHEN c.receiver> c.caller THEN c.receiver
          END as callerx
    ,CASE WHEN c.caller<c.receiver THEN c.caller 
          WHEN c.receiver< c.caller THEN c.receiver
          END as receivery
from
    call_duration c) as call
GROUP BY
    call.callerx, call.receivery
ORDER BY
    conversation ASC
