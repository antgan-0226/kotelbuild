module redis/v9.0.5

go 1.22

replace github.com/antgan-0226/kotelbuild => ../../../../kotelbuild

replace github.com/antgan-0226/kotelbuild/test/verifier => ../../../../kotelbuild/test/verifier

require (
	// import this dependency to use verifier
	github.com/antgan-0226/kotelbuild/test/verifier v0.0.0-20241120084517-34540d547ff3
	github.com/redis/go-redis/v9 v9.0.5
	go.opentelemetry.io/otel v1.31.0
	go.opentelemetry.io/otel/sdk v1.31.0
)

require (
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/google/uuid v1.6.0 // indirect
	go.opentelemetry.io/otel/metric v1.31.0 // indirect
	go.opentelemetry.io/otel/trace v1.31.0 // indirect
	golang.org/x/sys v0.26.0 // indirect
)
