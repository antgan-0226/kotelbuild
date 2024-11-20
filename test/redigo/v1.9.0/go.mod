module redigo

go 1.22

replace github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test/verifier => ../../../../opentelemetry-go-auto-instrumentation/test/verifier

replace github.com/antgan-0226/opentelemetry-go-auto-instrumentation => ../../../../opentelemetry-go-auto-instrumentation

require (
	github.com/antgan-0226/opentelemetry-go-auto-instrumentation v0.5.0
    github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test/verifier v0.0.0-20241120080835-df6534803198
	github.com/gomodule/redigo v1.9.0
)