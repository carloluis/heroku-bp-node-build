# heroku-bp-node-build

Heroku buildpack for node apps with build step

Required `build` script in `package.json`

Use before nodejs buildpack:

```bash
$ heroku buildpacks:set https://github.com/carloluis/heroku-bp-node-build
$ heroku buildpacks:add --index 2 https://github.com/heroku/heroku-buildpack-nodejs
```

CLI installation

```bash
heroku create --buildpack https://github.com/carloluis/heroku-bp-node-build.git
```
