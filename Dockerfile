FROM rabbitmq:3.8-management
RUN python3 -c "import urllib.request; urllib.request.urlretrieve('https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v4.1.0/rabbitmq_delayed_message_exchange-4.1.0.ez', '/opt/rabbitmq/plugins/rabbitmq_delayed_message_exchange-4.1.0.ez')"
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
RUN rabbitmq-plugins enable rabbitmq_web_stomp
