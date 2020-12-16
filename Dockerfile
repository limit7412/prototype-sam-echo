FROM golang:latest as build-image

WORKDIR /go/src
COPY go.mod main.go ./

RUN go build -o ../bin/main

FROM public.ecr.aws/lambda/go:1

COPY --from=build-image /go/bin/ /var/task/

CMD ["main"]
