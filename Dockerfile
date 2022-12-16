FROM alpine:3.17 as builder
RUN apk add curl jq --no-cache
COPY ./download-latest-flyctl.sh /download-latest-flyctl.sh
RUN /download-latest-flyctl.sh

FROM alpine:3.17 as final
COPY --from=builder /usr/sbin/flyctl /usr/sbin/flyctl
ENTRYPOINT ["flyctl"]