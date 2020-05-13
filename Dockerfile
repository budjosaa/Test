FROM  cypress/base:10
RUN npm install -g cypress@4.5.0 --unsafe-perm
RUN npm install -g wait-on@5.0.0
RUN cypress -v