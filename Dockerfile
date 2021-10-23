FROM bellsoft/liberica-openjdk-alpine:11.0.12-7
RUN apk update && apk add iputils && apk add bash && apk add curl

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./build/libs/*.jar app.jar
ENTRYPOINT ["java", "-Dspring.output.ansi.enabled=ALWAYS", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000", "-jar", "app.jar"]