ARG base=python:3.12-bookworm
FROM ${base}
ARG base=python:3.12-bookworm

RUN apt update; apt install -y curl make git vim bash-completion jq yq
RUN pip install msgraph-sdk

ARG node_ver=20.x
RUN curl -L https://deb.nodesource.com/setup_${node_ver} | bash
RUN apt install -y nodejs

WORKDIR /opt/ms-graph-explorer
#ARG msge_ver=v10.5.1
RUN git clone https://github.com/microsoftgraph/microsoft-graph-explorer-v4.git .
RUN npm install; \
    npm run build

CMD npm start
