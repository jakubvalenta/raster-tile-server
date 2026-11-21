# Raster Tile Server

A web map that shows PNG [map tiles](https://en.wikipedia.org/wiki/Tiled_web_map).

It's a minimalist [OpenLayers](https://openlayers.org/) setup, useful as a quick
preview of your PNG map tiles.

Example:

```shell
# Put your tiles in ./tiles/
docker build -f Containerfile -t raster-tile-server .
docker run --init -it -p 8080:8080 -e PORT=8080 -v "$(pwd)/tiles:/app/tiles:ro" raster-tile-server
```

## Requirements

- Docker
- or Podman
- or Node.js >= 24

## Usage

Put your PNG map tiles in the `tiles` directory in format `{z}/{x}/{y}.png`.
Example:

```
tiles
├── 0
│   └── 0
│       └── 0.png
├── 1
│   ├── 0
│   │   ├── 0.png
│   │   └── 1.png
│   └── 1
│       ├── 0.png
│       └── 1.png
├── 2
│   ├── 0
│   │   ├── 0.png
│   │   ├── 1.png
│   │   ├── 2.png
│   │   └── 3.png
```

Build the Docker image:

```shell
docker build -f Containerfile -t raster-tile-server .
```

Run the Docker container (available at http://localhost:8080):

```shell
docker run --init -it -p 8080:8080 -e PORT=8080 -v "$(pwd)/tiles:/app/tiles:ro" raster-tile-server
```

## Development

Start a development server (available at http://localhost:5173):

```shell
npm start
```

## Deployment

To generate a build ready for production:

```shell
npm run build
```

Then deploy the contents of the `dist` directory to your server.

## Contributing

__Feel free to remix this project__ under the terms of the [Apache License,
Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).
