FROM rabbitmq:management
ADD https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v4.1.0/rabbitmq_delayed_message_exchange-4.1.0.ez /opt/rabbitmq/plugins/
ADD https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.7.1/plugins-rmqv4.1.x-erl27-elx1.18.zip /tmp
RUN apt install -y unzip
RUN unzip /tmp/plugins-rmqv4.1.x-erl27-elx1.18.zip -d /opt/rabbitmq/plugins/
RUN chown rabbitmq:rabbitmq /opt/rabbitmq/plugins/rabbitmq_delayed_message_exchange-4.1.0.ez
RUN chown rabbitmq:rabbitmq /opt/rabbitmq/plugins/rabbitmq_message_deduplication-0.7.1.ez
RUN chown rabbitmq:rabbitmq /opt/rabbitmq/plugins/elixir-1.18.3.ez
RUN chmod 644 /opt/rabbitmq/plugins/rabbitmq_delayed_message_exchange-4.1.0.ez
RUN chmod 644 /opt/rabbitmq/plugins/rabbitmq_message_deduplication-0.7.1.ez
RUN chmod 644 /opt/rabbitmq/plugins/elixir-1.18.3.ez
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
RUN rabbitmq-plugins enable rabbitmq_web_stomp
RUN rabbitmq-plugins enable rabbitmq_message_deduplication
