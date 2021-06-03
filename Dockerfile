FROM alpine
RUN apk add pciutils
CMD ["lspci"]

