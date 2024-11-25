module nethttp

go 1.22

replace github.com/antgan-0226/kotelbuild/test/verifier => ../../../kotelbuild/test/verifier

replace github.com/antgan-0226/kotelbuild => ../../../kotelbuild

require (
	github.com/antgan-0226/kotelbuild/test/verifier v0.0.0-20241121101330-eac0897bad02
	go.opentelemetry.io/otel/sdk v1.31.0
	go.opentelemetry.io/otel/sdk/metric v1.30.0
	golang.org/x/net v0.28.0
)

require (
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826 // indirect
	go.opentelemetry.io/otel v1.31.0 // indirect
	go.opentelemetry.io/otel/metric v1.31.0 // indirect
	go.opentelemetry.io/otel/trace v1.31.0 // indirect
	golang.org/x/sys v0.26.0 // indirect
	golang.org/x/text v0.17.0 // indirect
)
