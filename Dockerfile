FROM node:16-alpine
# Installing libvips-dev for sharp compatability
# RUN apt-get update && apt-get install -y libvips-dev

ARG NODE_ENV=development

ENV PORT=$PORT

WORKDIR /opt/
COPY ./strapi/package.json ./
COPY ./strapi/yarn.lock ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g
RUN yarn install
WORKDIR /opt/app
COPY ./strapi/ .
RUN yarn build
EXPOSE $PORT

CMD ["yarn", "develop"]