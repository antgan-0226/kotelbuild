module mux/v1.3.0

go 1.22

replace github.com/antgan-0226/kotelbuild/test/verifier => ../../../../kotelbuild/test/verifier

replace github.com/antgan-0226/kotelbuild => ../../../../kotelbuild

require (
	github.com/antgan-0226/kotelbuild/test/verifier v0.0.0-20241120084517-34540d547ff3
	github.com/gorilla/mux v1.3.0
	go.opentelemetry.io/otel/sdk v1.31.0
)

require (
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/gorilla/context v1.1.2 // indirect
	go.opentelemetry.io/otel v1.31.0 // indirect
	go.opentelemetry.io/otel/metric v1.31.0 // indirect
	go.opentelemetry.io/otel/trace v1.31.0 // indirect
	golang.org/x/sys v0.26.0 // indirect
)
