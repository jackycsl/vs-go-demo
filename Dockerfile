FROM golang:1.12-alpine AS builder

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
