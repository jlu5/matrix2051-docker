FROM debian:12
EXPOSE 2051/tcp

RUN apt-get update && \
    apt-get install -yy git elixir erlang-dev erlang-inets erlang-xmerl
RUN adduser --disabled-login --home /opt/matrix2051 matrix2051
USER matrix2051

RUN cd /opt/matrix2051 && \
    git clone https://github.com/progval/matrix2051 && \
    cd ./matrix2051 && \
    mix local.hex --force && \
    mix local.rebar --force && \
    MIX_ENV=prod mix deps.get && \
    MIX_ENV=prod mix release

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
