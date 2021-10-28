FROM node:12.16.1

WORKDIR /gva_web/
COPY . .

RUN npm install
RUN npm run build

FROM nginx:alpine


COPY ./nginx/conf.d/my.conf /etc/nginx/conf.d/my.conf
COPY --from=0 /gva_web/dist /usr/share/nginx/html
RUN cat /etc/nginx/nginx.conf
RUN cat /etc/nginx/conf.d/my.conf
RUN ls -al /usr/share/nginx/html
