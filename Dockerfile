FROM golang:1.16.0-buster AS builder
WORKDIR /usr/src/app
COPY src .
RUN go build -o desafio-go main.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
CMD [ "./desafio-go" ]