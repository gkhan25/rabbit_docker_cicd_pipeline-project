FROM python:3.7.7-slim
COPY bootstrap.sh /tmp/bootstrap.sh
RUN echo "Start!" \
    # Specify software versions de1918bc0ad4f36bd538debe0734d5f9
    && export PYTHON_REQUESTS_VERSION="2.20.0" \
    && export PYTHON_BEAUTIFULSOUP_VERSION="4.8.2" \
    && bash /tmp/bootstrap.sh
