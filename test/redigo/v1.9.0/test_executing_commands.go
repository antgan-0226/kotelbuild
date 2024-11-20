package main

import (
	"go.opentelemetry.io/otel/sdk/trace/tracetest"
	"os"

	"github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test/verifier"
	"github.com/gomodule/redigo/redis"
)

func main() {
	c, err := redis.Dial("tcp", "localhost:"+os.Getenv("REDIS_PORT"))
	if err != nil {
		panic(err)
	}
	defer c.Close()
	c.Send("SET", "foo", "bar")
	c.Send("GET", "foo")
	c.Flush()
	c.Receive()          // reply from SET
	_, err = c.Receive() // reply from GET

	verifier.WaitAndAssertTraces(func(stubs []tracetest.SpanStubs) {
		verifier.VerifyDbAttributes(stubs[0][0], "SET", "redis", "localhost", "SET foo bar", "SET")
		verifier.VerifyDbAttributes(stubs[1][0], "GET", "redis", "localhost", "GET foo", "GET")
	}, 2)
}
