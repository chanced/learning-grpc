setup:
	docker volume create --name=node__modules
	docker-compose -f build.docker-compose.yml run --rm install_code 

dev:
	docker-compose -f ./dev.docker-compose.yml down && docker-compose -f ./dev.docker-compose.yml up

gen:
	node ./node_modules/@grpc/proto-loader/build/bin/proto-loader-gen-types.js \
		--keepCase \
		--longs=Number \
		--enums=String \
		--defaults \
		--oneofs \
		--includeDirs ./packages/proto \
		--includeComments \
		--outDir ./packages/generated \
		--grpcLib @grpc/grpc-js \
		./packages/proto/*.proto