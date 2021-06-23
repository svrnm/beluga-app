# Beluga Application

A sample application to demonstrate how you can use the AppDynamics python agent with a java proxy running on a seperate host 

Learn more at [Python Agent Configuration in a Containerized Environment](https://docs.appdynamics.com/21.6/en/application-monitoring/install-app-server-agents/python-agent/python-agent-configuration-in-a-containerized-environment)

# Requirements

* docker
* docker-compose

# Usage

Edit the `[controller]` section in the [agent.stub.cfg](./agent.stub.cfg) file to your needs and rename that file to `agent.cfg`:

```shell
cp agent.stub.cfg agent.cfg
```

Now you are ready to spin up the application:

```
docker-compose up
```

The application comes with a load generator, so within a few minutes you should see some data in your AppDynamics Controller.

If you like you can scale up/scale down the `web` service and get more (or less) nodes:

```
docker-compose up --scale web=4 -d
```

## Troubleshooting

If you do not see any data appearing in your controller you can do the following to debug:

* Make sure that the load generator works. Remove `CURLOPTS: -s` from the [docker-compose.yml](./docker-compose.yml) and check for errors in the logs of the container.
* Make sure that the `web` container can reach the `appdynamics-proxy` container: 

```shell
docker exec -t -i beluga-app_web_1 nc -v appdynamics-proxy:8080
```

You should see an output like the following:

```
appdynamics-proxy:8080 (172.24.0.2:8080) open
�
```


