FROM java:8-jre

ENV VERTICLE_FILE target/accountservice-fat.jar

# Set the location of the verticles
ENV VERTICLE_HOME /opt/verticles

EXPOSE 8090

COPY $VERTICLE_FILE $VERTICLE_HOME/
COPY src/conf/docker.json $VERTICLE_HOME/


WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["java -Dvertx.logger-delegate-factory-class-name=io.vertx.core.logging.SLF4JLogDelegateFactory -jar accountservice-fat.jar -cluster -conf docker.json"]
