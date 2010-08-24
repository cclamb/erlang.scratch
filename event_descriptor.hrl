-record(event_descriptor,
	{hostname, 
    date_time_stamp = now(), 
    priority  = low, 
    severity  = low,
    type = informational,
    message}).
