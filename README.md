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


### But how do it know? 🤔

OpenTelemetry is just [another integration included with ddtrace](https://github.com/DataDog/dd-trace-java/tree/master/dd-java-agent/instrumentation/opentelemetry). When you set `DD_OTEL_ENABLED` a [TracerProvider](https://opentelemetry.io/docs/concepts/signals/traces/#tracer-provider) is created. Then the OTel <> ddtrace interop happens: the tracer uses the ddtrace API's [SpanBuilder](https://github.com/DataDog/dd-trace-java/blob/master/internal-api/src/main/java/datadog/trace/bootstrap/instrumentation/api/AgentTracer.java#L296) to create spans, but instead of using the Datadog default conventions it [follows OpenTelemetry conventions](https://github.com/DataDog/dd-trace-java/blob/master/dd-java-agent/instrumentation/opentelemetry/opentelemetry-1.4/src/main/java/datadog/trace/instrumentation/opentelemetry14/trace/OtelTracer.java#L23-#L24)

## Running the app

### Prepare ~/sandbox.docker.env file

If you haven't already, you'll need to [retrieve an API from from your Datadog account](https://app.datadoghq.com/organization-settings/api-keys), then add the following to `~/sandbox.docker.env`:

```
DD_API_KEY=<Your API Key>
```


### Prepare start/stop scripts

```
chmod +x run.sh stop.sh
```

### Start the sandbox
```
`./run.sh`
```

After about one minute your browser will be opened to the Traces search page, and shortly thereafter you should begin to see spans from your services flowing in real-time.

### Stop the sandbox 
```
`./stop.sh`
```




