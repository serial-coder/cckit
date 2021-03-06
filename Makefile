GOFLAGS ?= -mod=vendor
PROTO_PACKAGES_CC := examples/cpaper_asservice/service
PROTO_PACKAGES_GO := examples/cpaper_asservice/schema examples/cpaper_extended/schema state/schema
PROTO_PACKAGES_GW := examples/cpaper_asservice/service examples/payment/schema gateway/events gateway/service

test:
	@echo "go test -mod vendor ./..."
	@go test ./...

refresh-deps:
	@echo "go mod tidy"
	@GOFLAGS='' GONOSUMDB=github.com/hyperledger/fabric go mod tidy
	@echo "go mod vendor"
	@GOFLAGS='' GONOSUMDB=github.com/hyperledger/fabric go mod vendor

proto:
	@for pkg in $(PROTO_PACKAGES_CC) ;do echo $$pkg && buf generate --template buf.gen.cc.yaml --path $$pkg -o ./$$pkg; done
	@for pkg in $(PROTO_PACKAGES_GO) ;do echo $$pkg && buf generate --template buf.gen.go.yaml --path $$pkg -o ./$$(echo $$pkg | cut -d "/" -f1); done
	@for pkg in $(PROTO_PACKAGES_GW) ;do echo $$pkg && buf generate --template buf.gen.gw.yaml --path $$pkg -o ./$$(echo $$pkg | cut -d "/" -f1); done

clean:
	@for pkg in $(PROTO_PACKAGES_CC); do find $$pkg -name '*.pb.go' -delete;done
	@for pkg in $(PROTO_PACKAGES_GO); do find $$pkg -name '*.pb.go' -delete;done
	@for pkg in $(PROTO_PACKAGES_GW); do find $$pkg -name '*.pb.go' -delete;done