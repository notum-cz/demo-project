module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', "edR/3pxDj2xosfyUGOVuvg=="),
  },
  apiToken: {
    salt: env('API_TOKEN_SALT', "edR/3pxDj2xosfyUGOVuvg=="),
  },
});
