FROM eclipse-temurin:17

# install dependencies of opensourcecobol 4j
RUN apt-get update &&\
    apt-get install -y build-essential libgmp3-dev autoconf

# create library directories
RUN mkdir /root/.java_lib

# install SQLite JDBC driver
RUN curl -sS -L -o /root/.java_lib/sqlite.jar https://github.com/xerial/sqlite-jdbc/releases/download/3.36.0.3/sqlite-jdbc-3.36.0.3.jar
RUN curl -sS -L -o /root/.java_lib/postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.2.24.jre6.jar

ENV CLASSPATH=$CLASSPATH:/root/.java_lib/sqlite.jar:/root/.java_lib/postgresql.jar

# install opensourcecobol4j
RUN cd /root &&\
    curl -sS -L -o opensourcecobol4j-v1.0.7.tar.gz https://github.com/opensourcecobol/opensourcecobol4j/archive/refs/tags/v1.0.7.tar.gz &&\
    tar zxf opensourcecobol4j-v1.0.7.tar.gz &&\
    cd opensourcecobol4j-1.0.7 &&\
    ./configure --prefix=/usr/ &&\
    make &&\
    make install

# classpath settings
ENV CLASSPATH=$CLASSPATH:/root/.java_lib/sqlite.jar:/usr/lib/opensourcecobol4j/postgresql.jar:/usr/lib/opensourcecobol4j/libcobj.jar

# install esql
RUN cd /root &&\
    curl -sS -L -o ocesql4j-v1.0.1.tar.gz https://github.com/hfhbd/Open-COBOL-ESQL-4j/archive/refs/tags/v0.1.1.tar.gz &&\
    tar zxf ocesql4j-v1.0.1.tar.gz &&\
    cd Open-COBOL-ESQL-4j-0.1.1 &&\
    ./configure --prefix=/usr/ &&\
    make &&\
    make install

RUN curl -sS -L -o ocesql4j.jar https://github.com/opensourcecobol/Open-COBOL-ESQL-4j/releases/download/v1.0.1/ocesql4j.jar &&\
    cp ocesql4j.jar /root/.java_lib/ocesql4j.jar

ENV CLASSPATH=$CLASSPATH:/root/.java_lib/sqlite.jar:/root/.java_lib/postgresql.jar:/root/.java_lib/libcobj.jar:/root/.java_lib/ocesql4j.jar

WORKDIR /output
