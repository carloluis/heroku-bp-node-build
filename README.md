# Heroku Buildpack for Node.js Build

> Buildpack for Node.js apps with a build step defined on the package.json

[![GitHub license](https://img.shields.io/github/license/carloluis/heroku-bp-node-build.svg)](https://github.com/carloluis/heroku-bp-node-build/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/carloluis/heroku-bp-node-build.svg)](https://github.com/carloluis/heroku-bp-node-build/releases)

## How it works?

Inspect for a `package.json` file and a _build_ task defined within the _scripts_ section.

## Configure from `CLI`

Use after nodejs buildpack:

```bash
# create the app with nodejs buildpack
heroku create my-app --buildpack heroku/nodejs

# add heroku-bp-node-build
heroku buildpacks:add --index 2 https://github.com/carloluis/heroku-bp-node-build
```

## Configure from _app.json_ manifest:

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

## Locking to a buildpack version

Lock your buildpack to one specific version:
* First, find the version you want from [buildpack versions](https://github.com/carloluis/heroku-bp-node-build/releases).
* Then, specify that version with `buildpacks:set`

```bash
heroku buildpacks:set https://github.com/carloluis/heroku-bp-node-build#v0.1.0 -a my-app
```

## More

Read related info with buildpacks [here](https://devcenter.heroku.com/articles/buildpacks).

<details>
<summary>Buildpack Registry</summary>

This buildpack is available as `carloluis/node-build` on the [Heroku Buildpack Registry](https://devcenter.heroku.com/articles/buildpack-registry).

</details>

## License

MIT © [Carloluis](https://github.com/carloluis)
