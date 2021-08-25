FROM bellsoft/liberica-openjdk-alpine:14.0.2-13
RUN apk update && apk add iputils && apk add bash

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
