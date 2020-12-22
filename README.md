# docker-nextjs-sanity

A pretty simplified Docker Compose workflow that sets up a local environment for [Next.js](https://nextjs.org/docs/getting-started) development while leveraging [Sanity.io](https://www.sanity.io/docs)'s content platform.

## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

Next, navigate in your terminal to the directory you cloned this, and spin up the container(s) for the web server by running:

```
docker-compose up -d --build site
```

After that completes, follow the steps from the [nextjs/README.md](nextjs/README.md) to get your Next.js project added in (or create a new blank one).

Bringing up the Docker Compose network with `site` instead of just using `up`, ensures that only our site's containers are brought up at the start, instead of all of the command containers as well. The `nextjs` container will be running on port `3000`.

Two additional containers are included that handle `npm` and `npx` commands _without_ having to have these platforms installed on your local computer. Use the following command examples from your project root, modifying them to fit your particular use case.

```
docker-compose run --rm npm install tailwindcss

docker-compose run --rm npx create-next-app .
```

Next, follow the steps from the [studio/README.md](studio/README.md) to get the **Sanity Studio** set up.
