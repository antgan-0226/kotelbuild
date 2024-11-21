module redis/v9.0.5

go 1.22

replace github.com/antgan-0226/kotelbuild => ../../../../opentelemetry-go-auto-instrumentation

replace github.com/antgan-0226/kotelbuild/test/verifier => ../../../../kotelbuild/test/verifier

require (
	// import this dependency to use verifier
	github.com/antgan-0226/kotelbuild/test/verifier v0.0.0-20241120080835-df6534803198
	go.opentelemetry.io/otel v1.31.0
	go.opentelemetry.io/otel/sdk v1.31.0
	github.com/go-redis/redis/v8 v8.11.0
)

require (
	github.com/cespare/xxhash/v2 v2.1.2 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826 // indirect
	go.opentelemetry.io/otel/metric v1.31.0 // indirect
	go.opentelemetry.io/otel/sdk/metric v1.30.0 // indirect
	go.opentelemetry.io/otel/trace v1.31.0 // indirect
	golang.org/x/sys v0.26.0 // indirect
)
