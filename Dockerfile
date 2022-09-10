FROM golang:alpine as builder

WORKDIR /go/src/main

COPY . .

RUN CGO_ENABLED=0 go build -o /main main.go

FROM scratch

COPY --from=builder /main /main

ENTRYPOINT ["/main"]

