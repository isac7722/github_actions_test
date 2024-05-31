FROM python:3.12.3

RUN mkdir -p /apps

WORKDIR /apps/

COPY ./requirements.txt /apps/requirements.txt

RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN echo Asia/Seoul > /etc/timezone

RUN pip install --no-cache-dir --upgrade -r /apps/requirements.txt
 
COPY ./main.py /apps/main.py

# Expose the port that the app runs on
EXPOSE 9000
  
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9000", "--reload"]
