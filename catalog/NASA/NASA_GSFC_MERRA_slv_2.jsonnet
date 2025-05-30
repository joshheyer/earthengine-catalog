local id = 'NASA/GSFC/MERRA/slv/2';
local subdir = 'NASA';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'MERRA-2 M2T1NXSLV: Single-Level Diagnostics V5.12.4',
  version: 'V5.12.4',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    M2T1NXSLV (or tavg1_2d_slv_Nx) is an hourly time-averaged 2-dimensional data
    collection in Modern-Era Retrospective analysis for Research and
    Applications version 2 (MERRA-2). This collection consists of meteorology
    diagnostics at popularly used vertical levels, such as air temperature at
    2-meter (or at 10-meter, 850hPa, 500 hPa, 250hPa), wind components at
    50-meter (or at 2-meter, 10-meter, 850 hPa, 500hPa, 250 hPa), sea level
    pressure, surface pressure, and total precipitable water vapor (or ice
    water, liquid water). The data field is time-stamped with the central time
    of an hour starting from 00:30 UTC, e.g.: 00:30, 01:30, ... , 23:30 UTC.

    MERRA-2 is the latest version of global atmospheric reanalysis for
    the satellite era produced by NASA Global Modeling and Assimilation
    Office (GMAO) using the Goddard Earth Observing System Model (GEOS)
    version 5.12.4. The dataset covers the period of 1980-present with the
    latency of ~3 weeks after the end of a month.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    ee.link.license(
    'https://earthdata.nasa.gov/collaborate/open-data-services-and-software/data-information-policy'
    ),
  ],
  'gee:categories': ['atmosphere', 'climate', 'water-vapor'],
  keywords: [
    'condensation',
    'humidity',
    'merra',
    'nasa',
    'omega',
    'pressure',
    'slv',
    'temperature',
    'vapor',
    'water',
    'wind',
  ],
  providers: [
    ee.producer_provider('NASA/MERRA', 'https://gmao.gsfc.nasa.gov/reanalysis/MERRA-2/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('1980-01-01T00:00:00Z', null),
  summaries: {
    gsd: [
      69375,
      55000
    ],
    'eo:bands': [
      {
        name: 'CLDPRS',
        description: 'Cloud top pressure',
        'gee:units': units.pascal,
      },
      {
        name: 'CLDTMP',
        description: 'Cloud top temperature',
        'gee:units': units.kelvin,
      },
      {
        name: 'DISPH',
        description: 'Zero plane displacement height',
        'gee:units': units.meter,
      },
      {
        name: 'H1000',
        description: 'Height at 1000 mb',
        'gee:units': units.meter,
      },
      {
        name: 'H250',
        description: 'Height at 250 hPa',
        'gee:units': units.meter,
      },
      {
        name: 'H500',
        description: 'Height at 500 hPa',
        'gee:units': units.meter,
      },
      {
        name: 'H850',
        description: 'Height at 850 hPa',
        'gee:units': units.meter,
      },
      {
        name: 'OMEGA500',
        description: 'Omega at 500 hPa',
        'gee:units': 'Pa/s',
      },
      {
        name: 'PBLTOP',
        description: 'Pbltop pressure',
        'gee:units': units.pascal,
      },
      {
        name: 'PS',
        description: 'Surface pressure',
        'gee:units': units.pascal,
      },
      {
        name: 'Q250',
        description: 'Specific humidity at 250 hPa',
        'gee:units': units.mass_fraction,
      },
      {
        name: 'Q500',
        description: 'Specific humidity at 500 hPa',
        'gee:units': units.mass_fraction,
      },
      {
        name: 'Q850',
        description: 'Specific humidity at 850 hPa',
        'gee:units': units.mass_fraction,
      },
      {
        name: 'QV10M',
        description: '10-meter specific humidity',
        'gee:units': units.mass_fraction,
      },
      {
        name: 'QV2M',
        description: '2-meter specific humidity',
        'gee:units': units.mass_fraction,
      },
      {
        name: 'SLP',
        description: 'Sea level pressure',
        'gee:units': units.pascal,
      },
      {
        name: 'T10M',
        description: '10-meter air temperature',
        'gee:units': units.kelvin,
      },
      {
        name: 'T250',
        description: 'Air temperature at 250 hPa',
        'gee:units': units.kelvin,
      },
      {
        name: 'T2MDEW',
        description: 'Dew point temperature at 2 m',
        'gee:units': units.kelvin,
      },
      {
        name: 'T2MWET',
        description: 'Wet bulb temperature at 2 m',
        'gee:units': units.kelvin,
      },
      {
        name: 'T2M',
        description: '2-meter air temperature',
        'gee:units': units.kelvin,
      },
      {
        name: 'T500',
        description: 'Air temperature at 500 hPa',
        'gee:units': units.kelvin,
      },
      {
        name: 'T850',
        description: 'Air temperature at 850 hPa',
        'gee:units': units.kelvin,
      },
      {
        name: 'TO3',
        description: 'Total column ozone',
        'gee:units': units.dobson,
      },
      {
        name: 'TOX',
        description: 'Total column odd oxygen',
        'gee:units': units.area_density,
      },
      {
        name: 'TQI',
        description: 'Total precipitable ice water',
        'gee:units': units.area_density,
      },
      {
        name: 'TQL',
        description: 'Total precipitable liquid water',
        'gee:units': units.area_density,
      },
      {
        name: 'TQV',
        description: 'Total precipitable water vapor',
        'gee:units': units.area_density,
      },
      {
        name: 'TROPPB',
        description: 'Tropopause pressure (TROPP) based on blended estimate',
        'gee:units': units.pascal,
      },
      {
        name: 'TROPPT',
        description: 'Tropopause pressure based on thermal estimate',
        'gee:units': units.pascal,
      },
      {
        name: 'TROPPV',
        description: 'Tropopause pressure based on epv estimate',
        'gee:units': units.pascal,
      },
      {
        name: 'TROPQ',
        description: |||
            Tropopause specific humidity using blended tropp (TROPPB) estimate
        |||,
        'gee:units': units.mass_fraction,
      },
      {
        name: 'TROPT',
        description: 'Tropopause temperature using blended tropp estimate',
        'gee:units': units.kelvin,
      },
      {
        name: 'TS',
        description: 'Surface skin temperature',
        'gee:units': units.kelvin,
      },
      {
        name: 'U10M',
        description: '10-meter eastward wind',
        'gee:units': units.velocity_si,
      },
      {
        name: 'U250',
        description: 'Eastward wind at 250 hPa',
        'gee:units': units.velocity_si,
      },
      {
        name: 'U2M',
        description: '2-meter eastward wind',
        'gee:units': units.velocity_si,
      },
      {
        name: 'U500',
        description: 'Eastward wind at 500 hPa',
        'gee:units': units.velocity_si,
      },
      {
        name: 'U50M',
        description: 'Eastward wind at 50 meters',
        'gee:units': units.velocity_si,
      },
      {
        name: 'U850',
        description: 'Eastward wind at 850 hPa',
        'gee:units': units.velocity_si,
      },
      {
        name: 'V10M',
        description: '10-meter northward wind',
        'gee:units': units.velocity_si,
      },
      {
        name: 'V250',
        description: 'Northward wind at 250 hPa',
        'gee:units': units.velocity_si,
      },
      {
        name: 'V2M',
        description: '2-meter northward wind',
        'gee:units': units.velocity_si,
      },
      {
        name: 'V500',
        description: 'Northward wind at 500 hPa',
        'gee:units': units.velocity_si,
      },
      {
        name: 'V50M',
        description: 'Northward wind at 50 meters',
        'gee:units': units.velocity_si,
      },
      {
        name: 'V850',
        description: 'Northward wind at 850 hPa',
        'gee:units': units.velocity_si,
      },
      {
        name: 'ZLCL',
        description: 'Lifting condensation level',
        'gee:units': units.meter,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Surface Pressure',
        lookat: {
          lat: 39.91,
          lon: -95.62,
          zoom: 2,
        },
        image_visualization: {
          band_vis: {
            min: [
              81189.96666965343,
            ],
            max: [
              116812.8627263942,
            ],
            palette: [
              '001137',
              '01abab',
              'e7eb05',
              '620500',
            ],
            bands: [
              'PS',
            ],
          },
        },
      },
    ],
  },
  'gee:interval': {
    type: 'cadence',
    unit: 'hour',
    interval: 1,
  },
  'gee:terms_of_use': |||
    NASA promotes the full and open sharing of all data with research and
    applications communities, private industry, academia, and the general
    public.
  |||
}
