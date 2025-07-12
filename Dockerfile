#multistage Dockerfile
#stage 1: build Docker Image
#stage 2: build distroless image with reduced size. 

# containerize the go application that we have created

#start with the base image
FROM golang:1.22.5 as base

#set the working directory in the container
WORKDIR /app 

#copy the go.mod and go.sum files to the working directory
COPY go.mod ./

#Download all the dependencies
RUN go mod download

#copy the source code to the working directory
COPY . .

#Build the application
RUN go build -o main .

##########################################################
#Reduce the image size using multi-stage builds
# We will use a distroless image to run the application
FROM gcr.io/distroless/base

#copy the binary from the prvious stage
COPY --from=base /app/main .

#copy static files from the previous stage
COPY --from=base /app/static ./static

#Expose the port on which the application 
EXPOSE 8080

#Command to run the application
CMD ["./main"]


