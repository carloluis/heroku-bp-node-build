# heroku-bp-node-build

Heroku buildpack for node apps with build step

Required `build` script in `package.json`

CLI installation

```bash
heroku create --buildpack https://github.com/carloluis/heroku-bp-node-build.git
```

Use before nodejs buildpack:

```bash
$ heroku buildpacks:set https://github.com/heroku/heroku-buildpack-nodejs
$ heroku buildpacks:add --index 2 https://github.com/carloluis/heroku-bp-node-build
```

Configure builpacks in `app.json` file:

```json
 {
     "buildpacks": [
        {
            "url": "heroku/nodejs"
        },
        {
            "url": "https://github.com/carloluis/heroku-bp-node-build"
        }
    ]
}
```
