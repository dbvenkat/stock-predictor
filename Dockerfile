FROM ubuntu:20.04

WORKDIR .
RUN apt-get -y update  && apt-get install -y \
    python3-dev \
    apt-utils \
    python-dev \
    python3-pip \
    build-essential \   
&& rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -U cython
RUN pip install --no-cache-dir -U numpy
RUN pip install --no-cache-dir -U pystan==2.19.1.1

COPY requirements.txt .
RUN pip install --no-cache-dir -U -r  requirements.txt

COPY src/ .
EXPOSE 8000
CMD ["uvicorn", "main:app", "--reload", "--workers", "1", "--host", "0.0.0.0", "--port", "8000"]
