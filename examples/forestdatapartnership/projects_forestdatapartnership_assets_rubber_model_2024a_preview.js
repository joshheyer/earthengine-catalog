// Import the rubber probability model collection.
var dataset = ee.ImageCollection(
    'projects/forestdatapartnership/assets/rubber/model_2024a');

// Point to center
var lon = 106.48584;
var lat = 11.17099;

// Filter the collection to the 2020 mosaic.
var rubber2020 =
    dataset.filterDate(ee.Date('2020-01-01'), ee.Date('2020-12-31')).first();

var palette = ['#eff3ff', '#bdd7e7', '#6baed6', '#3182bd', '#08519c'];
var vis = {min: 0, max: 1.0, palette: palette};

// Display land cover on the map.
Map.setCenter(lon, lat, 13);

Map.addLayer(rubber2020, vis);

// Preview image.

// Degrees in EPSG:3857
var delta = 0.043;
// Width and Height of the Thumbail image.
var pixels = 256;


var areaOfInterest = ee.Geometry.Rectangle(
    [lon - delta, lat - delta, lon + delta, lat + delta], null, false);

var parameters = {
  dimensions: [pixels, pixels],
  region: areaOfInterest,
  crs: 'EPSG:3857',
  format: 'png'
};

var image = rubber2020.visualize({palette: palette});

print(ui.Thumbnail({image: image, params: parameters}));