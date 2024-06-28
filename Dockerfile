FROM rabbitmq:3.13

# Define environment variables.
ENV RABBITMQ_PID_FILE=/var/lib/rabbitmq/mnesia/rabbitmq

COPY ./rabbitmq-start.sh /
RUN chmod +x /rabbitmq-start.sh

EXPOSE 5672

CMD ["/rabbitmq-start.sh"]
