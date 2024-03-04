# Heroku Vector Logs

This repo provides an example of how to deploy [Vector](https://vector.dev) to Heroku in order to collect logs from the Heroku Logplex, modify them, and send them to Datadog.

## Running this example

1. Create a new Heroku app named `heroku-vector-logs`:

   ```shell
   heroku apps:create heroku-vector-logs
   ```

1. Set your new app to run containers:

   ```shell
   heroku stack:set container
   ```

1. Set your Datadog API key and create credentials to secure this Vector instance:

   ```shell
   heroku config:set DD_API_KEY=XXXXX
   heroku config:set VECTOR_AUTH_USERNAME=YYYYY
   heroku config:set VECTOR_AUTH_PASSWORD=ZZZZZ
   ```

   You can find or create your Datadog API key inside the [Datadog platform](https://app.datadoghq.com/organization-settings/api-keys). The Vector credentials you set here must be used when adding a log drain to your Heroku apps in order for them to connect to Vector.

1. Deploy Vector:

   ```shell
   git push heroku main
   ```

1. To send your app's logs to Vector:

   ```shell
   # Get the URL of the Vector deployment
   heroku domains -a heroku-vector-logs

   # Using the domain and the credentials created above, set the drain for your-heroku-app.
   # Note the /events endpoint
   heroku drains:add https:YYYYY:ZZZZZ@domain.herokuapp.com/events -a your-heroku-app
   ```

## More resources

For more information about Vector, see the documentation and guides at [Vector.dev](https://vector.dev).

For more information about Log Management with Datadog, see [the documentation](https://docs.datadoghq.com/logs/).

To instrument your Heroku apps, see the [Datadog Heroku Buildpack](https://docs.datadoghq.com/agent/basic_agent_usage/heroku/).
