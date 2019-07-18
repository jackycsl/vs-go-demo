ARG GO_VERSION=1.12

FROM golang:${GO_VERSION}-alpine AS builder

ENV GO111MODULE=on
ENV CGO_ENABLED=0

WORKDIR /src

COPY ./ ./

RUN go build \
    -installsuffix 'static' \
    -o /app .

FROM scratch AS final

COPY --from=builder /app /app
COPY --from=builder /src/ui /ui

EXPOSE 4000

ENTRYPOINT ["/app"]
