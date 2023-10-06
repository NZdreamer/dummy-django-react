# pull official base image
FROM python:3.9

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH "${PYTHONPATH}:/dummy-django-react-proj"

# set work directory
WORKDIR /dummy-django-react-proj/backend

# # install psycopg2 dependencies
RUN apt-get update && apt-get install -y postgresql-server-dev-all gcc python3-dev libc6-dev
RUN apt-get install -y netcat-traditional

# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/dummy-django-react-proj/backend/entrypoint.sh"]
