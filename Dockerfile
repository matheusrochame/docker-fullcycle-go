FROM golang:1.20-alpine AS build

WORKDIR /usr/src

RUN go mod init app

COPY . .

RUN go build -a -o app

FROM scratch

WORKDIR /app

COPY --from=build /usr/src/app .

ENTRYPOINT ["./app"]