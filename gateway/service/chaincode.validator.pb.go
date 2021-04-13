// Code generated by protoc-gen-gogo. DO NOT EDIT.
// source: service/chaincode.proto

package service

import (
	fmt "fmt"
	proto "github.com/golang/protobuf/proto"
	_ "github.com/hyperledger/fabric-protos-go/peer"
	github_com_mwitkow_go_proto_validators "github.com/mwitkow/go-proto-validators"
	math "math"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

func (this *ChaincodeInput) Validate() error {
	// Validation of proto3 map<> fields is unsupported.
	return nil
}
func (this *ChaincodeLocator) Validate() error {
	return nil
}
func (this *ChaincodeExec) Validate() error {
	if this.Input != nil {
		if err := github_com_mwitkow_go_proto_validators.CallValidatorIfExists(this.Input); err != nil {
			return github_com_mwitkow_go_proto_validators.FieldError("Input", err)
		}
	}
	return nil
}
