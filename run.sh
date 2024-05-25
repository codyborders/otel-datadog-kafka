#!/bin/bash

echo "Spinning up sandbox. Your browser will open the Kafka producer's Service page in Datadog in about one minute"

docker-compose -f docker-compose-otel.yaml up -d

sleep 30

for ((i=1;i<=200;i++)); do
# Target existing service’s routes
curl localhost:9090/calendar -A 'dd-test-scanner-log';
# Target non existing service’s routes
curl localhost:9090/calendarss -A 'dd-test-scanner-log';
# SQLi attempt
curl "localhost:9090/index.php?username=1'%20or%20'1'%20=%20'1'))%20LIMIT%201/*&amp;password=foo";

done

sleep 30

open "https://app.datadoghq.com/apm/services/calendar-producer-java-otel-api-dd/operations/servlet.request/resources?dependencyMap=qson%3A%28data%3A%28telemetrySelection%3Aall_sources%29%2Cversion%3A%210%29&env=otelapi-with-dd-kafka&fromUser=false&groupMapByOperation=null&isInferred=false&panels=qson%3A%28data%3A%28%29%2Cversion%3A%210%29&resources=qson%3A%28data%3A%28visible%3A%21t%2Chits%3A%28selected%3Atotal%29%2Cerrors%3A%28selected%3Atotal%29%2Clatency%3A%28selected%3Ap95%29%2CtopN%3A%215%29%2Cversion%3A%211%29&summary=qson%3A%28data%3A%28visible%3A%21t%2Cerrors%3A%28selected%3Acount%29%2Chits%3A%28selected%3Acount%29%2Clatency%3A%28selected%3Alatency%2Cslot%3A%28agg%3A95%29%2Cdistribution%3A%28isLogScale%3A%21f%29%2CshowTraceOutliers%3A%21t%29%2Csublayer%3A%28slot%3A%28layers%3Aservice%29%2Cselected%3Apercentage%29%29%2Cversion%3A%211%29&view=spans&start=1716647814087&end=1716651414087&paused=true"

