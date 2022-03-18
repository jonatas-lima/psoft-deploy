FROM postgres:11

ENV POSTGRES_USER=tcc_match

ENV POSTGRES_PASSWORD=c02Ftf2YeSLazlQPPvjgSBGAs7BvZHWoeEUtubCOfSkUcrI7XoS2ClIN68tNcraT

ENV POSTGRES_HOST_AUTH_METHOD=trust

COPY ./migrate-db.sh /docker-entrypoint-initdb.d/

EXPOSE 5432

CMD ["postgres"]