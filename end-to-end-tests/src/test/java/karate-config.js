function fn() {
  let env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  const config = {
    env: env,
    reservationUrl: '/api/flights/reservation', //The URL of the API
    clustersUrl: '/api/flights/clusters', //The URL of the API
    restheartUrl: '/reservations/'//The URL of the API
  };
  if (env === 'dev') {
    config.reservationUrl = 'http://localhost:3070' + config.reservationUrl //The entire URL with the host
    config.clustersUrl = 'http://localhost:4070' + config.clustersUrl //The entire URL with the host
    config.restheartUrl = 'http://localhost:8082' + config.restheartUrl //The entire URL with the host
  } else if (env === 'e2e') {
    config.reservationUrl = 'http://localhost:3070' + config.reservationUrl
    config.clustersUrl = 'http://localhost:4070' + config.clustersUrl //The entire URL with the host
    config.restheartUrl = 'http://localhost:8082' + config.restheartUrl //The entire URL with the host
  }

  // Enable pretty printing for requests and responses
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  return config;
}