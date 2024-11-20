// Copyright (c) 2024 Alibaba Group Holding Ltd.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package client

import (
	"context"
	"github.com/antgan-0226/opentelemetry-go-auto-instrumentation/pkg/inst-api/instrumenter"

	"github.com/antgan-0226/opentelemetry-go-auto-instrumentation/pkg/api"
	"github.com/cloudwego/hertz/pkg/app/client"
	"github.com/cloudwego/hertz/pkg/protocol"
)

var hertzClientEnabler = instrumenter.NewDefaultInstrumentEnabler()

var hertzClientInstrumenter = BuildHertzClientInstrumenter()

func otelClientMiddleware(next client.Endpoint) client.Endpoint {
	return func(ctx context.Context, req *protocol.Request, resp *protocol.Response) (err error) {
		ctx = hertzClientInstrumenter.Start(ctx, req)
		err = next(ctx, req, resp)
		if err != nil {
			hertzClientInstrumenter.End(ctx, req, resp, err)
			return err
		}
		hertzClientInstrumenter.End(ctx, req, resp, nil)
		return nil
	}
}

func afterHertzClientBuild(call api.CallContext, c *client.Client, err error) {
	if !hertzClientEnabler.Enable() {
		return
	}
	if err != nil {
		return
	}
	c.Use(otelClientMiddleware)
}
