FROM golang:1.16-alpine
WORKDIR go/src/app
COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . ./

RUN go get github.com/gin-gonic/gin/binding@v1.8.1
RUN go build -o /docker-gs-ping

EXPOSE 8080

CMD [ "/docker-gs-ping" ]
