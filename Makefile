# Copyright (c) 2024 Alibaba Group Holding Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Get the current operating system and CPU architecture of the system
CURRENT_OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
CURRENT_ARCH := $(shell uname -m)

ifeq ($(CURRENT_ARCH), x86_64)
   CURRENT_ARCH := amd64
endif

# Get the current Git commit ID
CHECK_GIT_DIRECTORY := $(if $(wildcard .git),true,false)
ifeq ($(CHECK_GIT_DIRECTORY),true)
	BRANCH_NAME := $(shell git rev-parse --abbrev-ref HEAD)
	ifeq ($(findstring /,$(BRANCH_NAME)),/)
		MAIN_VERSION := $(shell echo $(BRANCH_NAME) | cut -d'/' -f2-)
	else
		MAIN_VERSION := 1.0.0
	endif
	COMMIT_ID := $(shell git rev-parse --short HEAD)
else
	BRANCH_NAME := 1.0.0
	MAIN_VERSION := 1.0.0
	COMMIT_ID := default
endif

# General build options
MOD_NAME := github.com/antgan-0226/opentelemetry-go-auto-instrumentation
TOOL_REL_NAME := otelbuild

VERSION := $(MAIN_VERSION)_$(COMMIT_ID)

XVERSION := -X=$(MOD_NAME)/tool/shared.TheVersion=$(VERSION)
XNAME := -X=$(MOD_NAME)/tool/shared.TheName=$(TOOL_REL_NAME)
STRIP_DEBUG := -s -w
LDFLAGS := $(XVERSION) $(XNAME) $(STRIP_DEBUG)
BUILD_CMD = CGO_ENABLED=0 GOOS=$(1) GOARCH=$(2) go build -ldflags="$(LDFLAGS)" -o $(3)

OUTPUT_BASE = $(TOOL_REL_NAME)
OUTPUT_DARWIN_AMD64 = $(OUTPUT_BASE)-darwin-amd64
OUTPUT_LINUX_AMD64 = $(OUTPUT_BASE)-linux-amd64
OUTPUT_WINDOWS_AMD64 = $(OUTPUT_BASE)-windows-amd64.exe
OUTPUT_DARWIN_ARM64 = $(OUTPUT_BASE)-darwin-arm64
OUTPUT_LINUX_ARM64 = $(OUTPUT_BASE)-linux-arm64

.PHONY: all test clean

all: clean darwin_amd64 linux_amd64 windows_amd64 darwin_arm64 linux_arm64

.PHONY: build
build:
	go mod tidy
	$(call BUILD_CMD,$(CURRENT_OS),$(CURRENT_ARCH),$(OUTPUT_BASE))

darwin_amd64:
	go mod tidy
	$(call BUILD_CMD,darwin,amd64,$(OUTPUT_DARWIN_AMD64))

linux_amd64:
	go mod tidy
	$(call BUILD_CMD,linux,amd64,$(OUTPUT_LINUX_AMD64))

windows_amd64:
	go mod tidy
	$(call BUILD_CMD,windows,amd64,$(OUTPUT_WINDOWS_AMD64))

darwin_arm64:
	go mod tidy
	$(call BUILD_CMD,darwin,arm64,$(OUTPUT_DARWIN_ARM64))

linux_arm64:
	go mod tidy
	$(call BUILD_CMD,linux,arm64,$(OUTPUT_LINUX_ARM64))

clean:
	rm -f $(OUTPUT_DARWIN_AMD64) $(OUTPUT_LINUX_AMD64) $(OUTPUT_WINDOWS_AMD64) $(OUTPUT_DARWIN_ARM64) $(OUTPUT_LINUX_ARM64) $(OUTPUT_BASE)
	go clean

test:
	go test -timeout 50m -v github.com/antgan-0226/opentelemetry-go-auto-instrumentation/test