![](docs/anim-logo.svg)

[![](https://shields.io/badge/Docs-English-blue?logo=Read%20The%20Docs)](./docs)
[![](https://shields.io/badge/Readme-中文-blue?logo=Read%20The%20Docs)](./docs/README_CN.md)
[![codecov](https://codecov.io/gh/alibaba/opentelemetry-go-auto-instrumentation/branch/main/graph/badge.svg)](https://codecov.io/gh/alibaba/opentelemetry-go-auto-instrumentation)

This project provides an automatic solution for Golang applications that want to
leverage OpenTelemetry to enable effective observability. No code changes are
required in the target application, the instrumentation is done at compile
time. Simply replacing `go build` with `otelbuild` to get started :rocket:

TODO