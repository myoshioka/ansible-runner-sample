FROM ansible/ansible-runner

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

ENV APP_PATH=/code \
    HOME=/root \
    AWS_SDK_LOAD_CONFIG=1

WORKDIR /root/.aws

RUN echo -e "[default]\n\
aws_access_key_id = ${AWS_ACCESS_KEY_ID}\n\
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}\n"\
> credentials

RUN echo -e "[default]\n\
source_profile = default\n\
region = ap-northeast-1\n"\
> config

WORKDIR /root

RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python && \
    pip install boto boto3 botocore

WORKDIR $APP_PATH

RUN ansible-galaxy collection install amazon.aws
RUN ansible-galaxy collection install community.aws
