## The purpose of this project

The goal is to provide a working example that can help answer questions like "What's the difference between OpenTelemetry and Datadog tracing libraries?" or "What do I get with ddtrace and the Datadog agent that I won't get with OTel?". 


### Interoperability between OTel and ddtrace 🤝


All Datadog ddtrace libraries implement the OTel API. This means that if you've manually instrumentated your application using OpenTelemetry, you can drop in ddtrace by simply downloading the `dd-java-agent.jar` and setting the appropriate JVM flags or environment variables. When used in tandem with the Datadog infrastructure agent, you can then use *all* of the Datadog-native products and features, including:

 * 700+ integrations
 * Network Performance Monitoring
 * Live Process Monitoring
 * Cloud Security Management
 * Application Security Management
 * Continuous Profiler
 * Data Streams Monitoring
 * Database Monitoring
 * Remote Configuration
 * Dynamic Instrumentation

As well as all of the configuration options available in ddtrace, allowing you to build your application using vendor-neutral APIs while reaping the benefits of signals and functionality not yet available in OpenTelemetry.


### But how do it know?

OpenTelemetry is just [another integration included with ddtrace](https://github.com/DataDog/dd-trace-java/tree/master/dd-java-agent/instrumentation/opentelemetry). When you set `DD_OTEL_ENABLED` a [TracerProvider](https://opentelemetry.io/docs/concepts/signals/traces/#tracer-provider) is created. Then the OTel <> ddtrace interop happens: the tracer uses the ddtrace API's [SpanBuilder](https://github.com/DataDog/dd-trace-java/blob/master/internal-api/src/main/java/datadog/trace/bootstrap/instrumentation/api/AgentTracer.java#L296) to create spans, but instead of using the Datadog default conventions it [follows OpenTelemetry conventions](https://github.com/DataDog/dd-trace-java/blob/master/dd-java-agent/instrumentation/opentelemetry/opentelemetry-1.4/src/main/java/datadog/trace/instrumentation/opentelemetry14/trace/OtelTracer.java#L23-#L24)

## Running the app

### Docker Compose

Retrieve API_KEY from datadoghq, and expose same on Shell

```
export DD_API_KEY=xx

```
Bring up the services

```
docker compose -f docker-compose-otel.yaml up
```

### Create ASM Threat Scenario

Simulate an attacker scanning for vulnerabilities by creating and running a shell script:

```
for ((i=1;i<=200;i++)); do
# Target existing service’s routes
curl localhost:9090/calendar -A 'dd-test-scanner-log';
# Target non existing service’s routes
curl localhost:9090/calendarss -A 'dd-test-scanner-log';
done

```







