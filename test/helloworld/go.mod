module helloworld

go 1.22

replace github.com/antgan-0226/kotelbuild => ../../../opentelemetry-go-auto-instrumentation

replace github.com/antgan-0226/kotelbuild/test/verifier => ../../../kotelbuild/test/verifier

require golang.org/x/time v0.5.0
