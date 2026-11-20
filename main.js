import './style.css';
import { Map, View } from 'ol';
import TileLayer from 'ol/layer/Tile';
import ImageTile from 'ol/source/ImageTile';

const map = new Map({
  target: 'map',
  layers: [
    new TileLayer({
      source: new ImageTile({ url: '/tiles/{z}/{x}/{y}.png' })
    })
  ],
  view: new View({
    center: [0, 0],
    zoom: 2
  })
});
