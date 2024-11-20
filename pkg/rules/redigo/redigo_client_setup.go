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

package redigo

import (
	"context"
	"net"
	"time"

	"github.com/antgan-0226/opentelemetry-go-auto-instrumentation/pkg/api"
	"github.com/antgan-0226/opentelemetry-go-auto-instrumentation/pkg/inst-api/instrumenter"
	"github.com/gomodule/redigo/redis"
)

var redigoEnabler = instrumenter.NewDefaultInstrumentEnabler()

func onBeforeDialContext(call api.CallContext, ctx context.Context, network, address string, options ...redis.DialOption) {
	if !redigoEnabler.Enable() {
		return
	}
	data := make(map[string]interface{}, 2)
	data["endpoint"] = address
	data["ctx"] = ctx
	call.SetData(data)
}

func onExitDialContext(call api.CallContext, conn redis.Conn, err error) {
	if !redigoEnabler.Enable() {
		return
	}
	d := call.GetData()
	data, ok := d.(map[string]interface{})
	if !ok {
		return
	}
	e, ok := data["endpoint"]
	if !ok {
		return
	}
	endpoint, ok := e.(string)
	if !ok {
		return
	}
	c, ok := data["ctx"]
	if !ok {
		return
	}
	ctx, ok := c.(context.Context)
	if !ok {
		return
	}
	call.SetReturnVal(0, &armsConn{conn, endpoint, ctx})
}

func onEnterDialURLContext(call api.CallContext, ctx context.Context, rawurl string, options ...redis.DialOption) {
	if !redigoEnabler.Enable() {
		return
	}
	data := make(map[string]interface{}, 2)
	data["endpoint"] = rawurl
	data["ctx"] = ctx
	call.SetData(data)
}

func onExitDialURLContext(call api.CallContext, conn redis.Conn, err error) {
	if !redigoEnabler.Enable() {
		return
	}
	d := call.GetData()
	data, ok := d.(map[string]interface{})
	if !ok {
		return
	}
	e, ok := data["endpoint"]
	if !ok {
		return
	}
	endpoint, ok := e.(string)
	if !ok {
		return
	}
	c, ok := data["ctx"]
	if !ok {
		return
	}
	ctx, ok := c.(context.Context)
	if !ok {
		return
	}
	call.SetReturnVal(0, &armsConn{conn, endpoint, ctx})
}

func onEnterNewConn(call api.CallContext, netConn net.Conn, readTimeout, writeTimeout time.Duration) {
	if !redigoEnabler.Enable() {
		return
	}
	call.SetData(netConn.RemoteAddr().String())
}

func onExitNewConn(call api.CallContext, conn redis.Conn) {
	if !redigoEnabler.Enable() {
		return
	}
	e := call.GetData()
	endpoint, ok := e.(string)
	if !ok {
		return
	}
	call.SetReturnVal(0, &armsConn{conn, endpoint, context.Background()})
}
