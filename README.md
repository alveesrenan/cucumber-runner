# Cucumber #

This docker image run tests using chrome webdriver.

# Requirements
- Docker-compose [1.13.0+](https://github.com/docker/compose/releases)
- Connected to Atech's VPN
- Pass user when you run container, docker param: `--user=UID`, learn more below.

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
  --user=`id -u $USER` \
  registry.atech.com.br/cucumber-runner
```

**Passing cucumber options**
> In this example cucumber only show your version, but if you need other options, replace "--version".

```sh
docker run -v `pwd`/test:/cucumber/ -it --rm \
  --user=`id -u $USER` \
  registry.atech.com.br/cucumber-runner \
  --version
```

**Running using local deployment projects**
```sh
docker run -v `pwd`/test:/cucumber/ -it --rm \
  --net=host \
  --user=`id -u $USER` \
  registry.atech.com.br/cucumber-runner
```

**Open chrome display**

To open host's chrome follow example below:

```sh
docker run -it --rm \
  --user=`id -u $USER` \
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
