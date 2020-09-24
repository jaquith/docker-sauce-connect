# Docker Sauce Labs Connect

This docker image runs [Sauce Labs Connect](https://wiki.saucelabs.com/display/DOCS/Sauce+Connect+Proxy) on Java 8. Docker image can be found [on docker hub](https://hub.docker.com/r/joscha/docker-sauce-connect/).

This is specifically customized to work within Tealium's webdriverio based testing platform.


## Versions

* `latest`
* `4.5`

## Usage

It sets the `sc` CLI as the entrypoint so it can be used as a replacement via
an shell alias:

```sh
$ alias sc="docker run --rm -it -p 8000:8000 joscha/sauce-connect"
$ sc -P 8000 -u $SAUCE_USERNAME -k $SAUCE_ACCESS_KEY
```

Or just

```sh
$ docker run --rm -it \
             -p 0.0.0.0:8000:8000 \
             joscha/sauce-connect -P 8000 \
                                 -u $SAUCE_USERNAME \
                                 -k $SAUCE_ACCESS_KEY \
                                 --tunnel-identifier foo
```

## License

Licensed under [MIT](./LICENSE).
