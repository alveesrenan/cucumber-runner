# Cucumber #

This docker image run tests using chrome webdriver.

# Requirements
- Docker-compose [1.13.0+](https://github.com/docker/compose/releases)
- Connected to Atech's VPN

# Bundle install
By default, bundle install dependencies in `vendor/bundle` in your volume host folder.

Make sure you added in .gitignore.

To change this, pass environment `BUNDLE_INSTALL_PATH` to your container.

# Running your gherkins

**Steps:**
1. Map your cucumber project into /cucumber folder (volume)
2. Run container, examples below

**Docker command line example:**

```sh
docker run -v `pwd`/test:/cucumber/ -it --rm \
  registry.atech.com.br/cucumber-runner
```

**Docker compose example:**
```yaml
cucumber:
  image: registry.atech.com.br/cucumber-runner
  volumes:
    - ./test:/cucumber
```

**Passing cucumber options**
> In this example cucumber only show your version, but if you need other options, replace "--version" for your options.

```sh
docker run -v `pwd`/test:/cucumber/ -it --rm \
  registry.atech.com.br/cucumber-runner \
  --version
```

```yaml
cucumber:
  image: registry.atech.com.br/cucumber-runner
  volumes:
    - ./test:/cucumber
  command: "--version"
```

**Running using local deployment projects**
```sh
docker run -v `pwd`/test:/cucumber/ -it --rm \
--net=host \
  registry.atech.com.br/cucumber-runner
```

```yaml
cucumber:
  image: registry.atech.com.br/cucumber-runner
  volumes:
    - ./test:/cucumber
  network_mode: "host"
```

**Open chrome display**

To open host's chrome follow example below:

```sh
docker run -it --rm \
  -v `pwd`/test:/cucumber \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  registry.atech.com.br/cucumber-runner
```

**Prevent container exit**
To prevent container exit, passing environment `LOCK` with true value

```sh
docker run -v `pwd`/test:/cucumber/ -it --rm \
  -e LOCK=true \
  registry.atech.com.br/cucumber-runner
```

```yaml
cucumber:
  image: registry.atech.com.br/cucumber-runner
  volumes:
    - ./test:/cucumber
  environment:
    - LOCK=true
```
