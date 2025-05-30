local id = 'LANDSAT/COMPOSITES/C02/T1_L2_8DAY_NBR';
local subdir = 'LANDSAT';
local version = 'COMPOSITES/C02';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local notes = import 'templates/LANDSAT_COMPOSITES_L2.libsonnet';
local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_ver,
  ],
  id: id,
  version: version,
  title: 'Landsat Collection 2 Tier 1 Level 2 8-Day NBR Composite',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    These Landsat Collection 2 Tier 1 Level 2 composites are made from Tier 1 Level 2 orthorectified scenes.

    The Normalized Burn Ratio Thermal (NBRT) index is
    generated from the Near-IR, Mid-IR (2215 nm), and Thermal bands, and
    has a range from -1.0 to 1.0. See
    [Holden et al. (2005)](https://www.tandfonline.com/doi/abs/10.1080/01431160500239008)
    for details.

    These composites are created from
    all the scenes in each
    8-day period beginning from the first day of the year and continuing
    to the 360th day of the year.  The last composite of the year,
    beginning on day 361, will overlap the first composite of the
    following year by 3 days.  All the images from each 8-day period are
    included in the composite, with the most recent pixel as the composite value.
  ||| + notes.description,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
  ],
  'gee:categories': ['vegetation-indices'],
  keywords: [
    'landsat',
    'nbrt',
    'usgs',
  ],
  providers: [
    ee.producer_provider('Google', 'https://earthengine.google.com'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('1984-01-01T00:00:00Z', null),
  summaries: {
    'eo:bands': [
      {
        name: 'NBR',
        description: 'Normalized Burn Ratio Thermal',
        gsd: 30.0,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Colorized',
        lookat: {
          lon: 6.746,
          lat: 46.529,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.9,
            ],
            max: [
              1.0,
            ],
            palette: [
              '000000',
              'ffffff',
            ],
            bands: [
              'NBR',
            ],
          },
        },
      },
    ],
  },
  'gee:min_zoom_level': 4,
  'gee:interval': {type: 'cadence', unit: 'day', interval: 8},
  'gee:terms_of_use': importstr 'terms_of_use.md',
  'gee:is_derived': true,
}
