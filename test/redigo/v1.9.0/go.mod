module redigo

go 1.22

replace github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test/verifier => ../../../../opentelemetry-go-auto-instrumentation/test/verifier

replace github.com/antgan-0226/opentelemetry-go-auto-instrumentation => ../../../../opentelemetry-go-auto-instrumentation

require (
	github.com/antgan-0226/opentelemetry-go-auto-instrumentation v0.5.0
    github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test/verifier v0.5.0
	github.com/gomodule/redigo v1.9.0
)