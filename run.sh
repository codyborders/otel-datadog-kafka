#!/bin/bash

echo "
############################################################

Spinning up sandbox

############################################################"

docker-compose -f docker-compose-otel.yaml up -d

sleep 30

echo "
############################################################

Opening your browser to the Datadog live trace search page

############################################################"

open "https://app.datadoghq.com/apm/traces?query=&agg_m=count&agg_m_source=base&agg_t=count&cols=service%2Cresource_name%2C%40duration%2C%40http.method%2C%40http.status_code%2C%40_duration.by_service&fromUser=true&historicalData=false&query_translation_version=v0&spanType=all&traceQuery=&view=spans&viz=stream&start=1716652490990&end=1716653390990&paused=false"

for ((i=1;i<=200;i++)); do
# Target existing service’s routes
curl localhost:9090/calendar -A 'dd-test-scanner-log';
# Target non existing service’s routes
curl localhost:9090/calendarss -A 'dd-test-scanner-log';
# SQLi attempt
curl "localhost:9090/index.php?username=1'%20or%20'1'%20=%20'1'))%20LIMIT%201/*&amp;password=foo";

done


