FROM golang:1-alpine3.10 AS build-env
WORKDIR /app
COPY . .
RUN go build hello-world.go
RUN rm hello-world.go | rm Dockerfile

FROM scratch
COPY --from=build-env /app/hello-world /
CMD [ "./hello-world"]