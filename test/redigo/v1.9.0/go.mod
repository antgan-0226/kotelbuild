module redigo

go 1.22

replace github.com/antgan-0226/kotelbuild/test/verifier => ../../../../kotelbuild/test/verifier

replace github.com/antgan-0226/kotelbuild => ../../../../kotelbuild

require (
	github.com/antgan-0226/kotelbuild v0.5.4
    github.com/antgan-0226/kotelbuild/test/verifier v0.0.0-20241121101330-eac0897bad02
	github.com/gomodule/redigo v1.9.0
)