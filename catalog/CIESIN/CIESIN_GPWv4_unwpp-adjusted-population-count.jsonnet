local id = 'CIESIN/GPWv4/unwpp-adjusted-population-count';
local versions = import 'versions.libsonnet';
local version_table = import 'templates/GPW_adjusted_population_count_versions.libsonnet';

local subdir = 'CIESIN';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local version_config = versions(subdir, version_table, id);
local version = version_config.version;
local license = spdx.cc_by_4_0;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'GPWv4: Gridded Population of the World Version 4, UN-Adjusted Population Count [deprecated]',
  version: version,
  'gee:status': 'deprecated',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The Gridded Population of World Version 4 (GPWv4) models the distribution
    of global human population for the years 2000, 2005, 2010, 2015, and 2020
    on 30 arc-second (approximately 1 km) grid cells. Population is distributed
    to cells using proportional allocation of population from census and
    administrative units. Population input data are collected at the most
    detailed spatial resolution available from the results of the 2010 round of
    censuses, which occurred between 2005 and 2014. The input data are
    extrapolated to produce population estimates for each modeled year.

    These population count grids contain estimates of the number of persons per
    30 arc-second grid cell, consistent with national censuses and population
    registers with respect to relative spatial distribution but adjusted to
    match the 2015 Revision of UN World Population Prospects country totals.
    There is one image for each modeled year.

    [General Documentation](https://beta.sedac.ciesin.columbia.edu/data/set/gpw-v4-population-count-adjusted-to-2015-unwpp-country-totals/docs)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    ee.link.license(license.reference),
    {
      rel: ee_const.rel.cite_as,
      href: 'https://doi.org/10.7927/H4SF2T42',
    },
  ] + version_config.version_links,
  'gee:categories': ['population'],
  keywords: [
    'ciesin',
    'gpw',
    'population',
  ],
  providers: [
    ee.producer_provider('CIESIN', 'https://sedac.ciesin.columbia.edu/data/collection/gpw-v4'),
    ee.host_provider(version_config.ee_catalog_url),
  ],
  'gee:provider_ids': [
    'C1418754426-SEDAC',
  ],
  extent: ee.extent_global('2000-01-01T00:00:00Z', '2020-01-01T00:00:00Z'),
  summaries: {
    gsd: [
      927.67,
    ],
    'eo:bands': [
      {
        name: 'population-count',
        description: 'The estimated number of persons per 30 arc-second grid cell.',
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Population Count',
        lookat: {
          lat: 19.81,
          lon: 79.1,
          zoom: 3,
        },
        image_visualization: {
          band_vis: {
            min: [
              200.0,
            ],
            max: [
              1000.0,
            ],
            palette: [
              'ffffff',
              'ffcdc6',
              'ff0000',
              '950000',
            ],
            bands: [
              'population-count',
            ],
          },
        },
      },
    ],
    'population-count': {
      minimum: 0.0,
      maximum: 940130.43,
      'gee:estimated_range': true,
    },
  },
  'sci:doi': '10.7927/H4SF2T42',
  'sci:citation': |||
    Center for International Earth Science Information Network - CIESIN -
    Columbia University. 2016. Gridded Population of the World, Version 4
    (GPWv4): Population Count Adjusted to Match 2015 Revision of UN WPP Country
    Totals. Palisades, NY: NASA Socioeconomic Data and Applications Center
    (SEDAC). [https://doi.org/10.7927/H4SF2T42](https://doi.org/10.7927/H4SF2T42).
    Accessed DAY MONTH YEAR.
  |||,
  'gee:interval': {
    type: 'cadence',
    unit: 'year',
    interval: 5,
  },
  'gee:terms_of_use': ee.gee_terms_of_use(license),
}
