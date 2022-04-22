FROM node:16
# Installing libvips-dev for sharp compatability
ARG NODE_ENV=development

WORKDIR /opt/
COPY ./package.json ./
COPY ./yarn.lock ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g
RUN yarn install
WORKDIR /opt/app
COPY ./ .
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]