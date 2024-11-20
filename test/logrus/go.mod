module logrus

go 1.22

replace github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test/verifier => ../../../opentelemetry-go-auto-instrumentation/test/verifier

replace github.com/antgan-0226/opentelemetry-go-auto-instrumentation => ../../../opentelemetry-go-auto-instrumentation

require (
	github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test/verifier v0.0.0-00010101000000-000000000000
	github.com/sirupsen/logrus v1.9.3
	go.opentelemetry.io/otel/sdk v1.31.0
)

require (
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/google/uuid v1.6.0 // indirect
	go.opentelemetry.io/otel v1.31.0 // indirect
	go.opentelemetry.io/otel/metric v1.31.0 // indirect
	go.opentelemetry.io/otel/trace v1.31.0 // indirect
	golang.org/x/sys v0.26.0 // indirect
)
