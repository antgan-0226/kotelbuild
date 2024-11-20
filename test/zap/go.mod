module zap

go 1.22

replace github.com/antgan-0226/opentelemetry-go-auto-instrumentation => ../../../opentelemetry-go-auto-instrumentation

replace github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test/verifier => ../../../opentelemetry-go-auto-instrumentation/test/verifier

require (
	github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test/verifier v0.5.0
	go.opentelemetry.io/otel/sdk v1.31.0
	go.uber.org/zap v1.20.0
)

require (
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826 // indirect
	go.opentelemetry.io/otel v1.31.0 // indirect
	go.opentelemetry.io/otel/metric v1.31.0 // indirect
	go.opentelemetry.io/otel/sdk/metric v1.30.0 // indirect
	go.opentelemetry.io/otel/trace v1.31.0 // indirect
	go.uber.org/atomic v1.7.0 // indirect
	go.uber.org/multierr v1.6.0 // indirect
	golang.org/x/sys v0.26.0 // indirect
)
