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
$ alias sc="docker run --rm -it -p 8000:8000 jaquith/sauce-connect"
$ sc -P 8000 -u $SAUCE_USERNAME -k $SAUCE_ACCESS_KEY
```

Or just

```sh
$ docker run --rm -it \
             -p 0.0.0.0:8000:8000 \
             jaquith/sauce-connect -P 8000 \
                                 -u $SAUCE_USERNAME \
                                 -k $SAUCE_ACCESS_KEY \
                                 --tunnel-identifier foo
```

## Build

To build a new image after updates:

- `docker build -t jaquith/docker-sauce-connect:test .` where 'test' is the 'tag' you want to use on Docker Hub.
- then `docker push jaquith/docker-sauce-connect:test` ('test' should match)

## Notes / Links

https://github.com/docker/machine/issues/1799#issuecomment-272570152

Install docker-machine 

```
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine
```

## License

Licensed under [MIT](./LICENSE).
