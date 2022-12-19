ARG FLYCTL_VERSION
FROM flyio/flyctl:${FLYCTL_VERSION} as builder

FROM alpine:3.17 as final
COPY --from=builder /flyctl /usr/sbin/flyctl
ENTRYPOINT ["flyctl"]