# Raster Tile Server

Create a directory `tiles` and copy your raster tiles there in format
`{z}/{x}/{y}.png`. Example:

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

Start a development server (available at http://localhost:5173):

```shell
npm start
```

To generate a build ready for production:

```shell
npm run build
```

Then deploy the contents of the `dist` directory to your server.
