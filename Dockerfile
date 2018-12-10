FROM nextcloud:latest

RUN apt-get update && apt-get install -y \
  cron \
  nano \
  && rm -rf /var/lib/apt/lists/*

RUN echo "*/15 * * * * su - www-data -s /bin/bash -c \"php -f /var/www/html/cron.php\""| crontab -
RUN crontab /etc/cron/crontab

CMD ["crond", "-f"]
