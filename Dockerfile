FROM python:3.8

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000

COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

RUN python manage.py collectstatic --noinput

CMD gunicorn stocks_products.wsgi -b 0.0.0.0:8000
