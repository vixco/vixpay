# Yollet API Client

Yollet 앱에서 필요한 API 를 지원하기 위한 dart 패키지

## Token API Client

* [Token API](http://pms.ibexlab.com/confluence/display/IBE/Token+API)

## gRPC API Client

#### Build

$ protoc --dart_out=grpc:lib/src/generated -Iproto proto/api/v1/*.proto

* [Dart/Quick Start](https://grpc.io/docs/languages/dart/quickstart/)
