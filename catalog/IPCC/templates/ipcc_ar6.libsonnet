local ee = import 'earthengine.libsonnet';
local ee_const = import 'earthengine_const.libsonnet';
local units = import 'units.libsonnet';

{
  BAND_PREFIXES: [
    'total_rates',
    'total_values',
    'AIS_rates',
    'AIS_values',
    'GIS_rates',
    'GIS_values',
    'glaciers_rates',
    'glaciers_values',
    'landwaterstorage_rates',
    'landwaterstorage_values',
    'oceandynamics_rates',
    'oceandynamics_values',
    'verticallandmotion_rates',
    'verticallandmotion_values',
  ],
  QUANTILES: [
    '0',
    '0_001',
    '0_005',
    '0_01',
    '0_02',
    '0_03',
    '0_04',
    '0_05',
    '0_06',
    '0_07',
    '0_08',
    '0_09',
    '0_1',
    '0_11',
    '0_12',
    '0_13',
    '0_14',
    '0_15',
    '0_16',
    '0_167',
    '0_17',
    '0_18',
    '0_19',
    '0_2',
    '0_21',
    '0_22',
    '0_23',
    '0_24',
    '0_25',
    '0_26',
    '0_27',
    '0_28',
    '0_29',
    '0_3',
    '0_31',
    '0_32',
    '0_33',
    '0_34',
    '0_35',
    '0_36',
    '0_37',
    '0_38',
    '0_39',
    '0_4',
    '0_41',
    '0_42',
    '0_43',
    '0_44',
    '0_45',
    '0_46',
    '0_47',
    '0_48',
    '0_49',
    '0_5',
    '0_51',
    '0_52',
    '0_53',
    '0_54',
    '0_55',
    '0_56',
    '0_57',
    '0_58',
    '0_59',
    '0_6',
    '0_61',
    '0_62',
    '0_63',
    '0_64',
    '0_65',
    '0_66',
    '0_67',
    '0_68',
    '0_69',
    '0_7',
    '0_71',
    '0_72',
    '0_73',
    '0_74',
    '0_75',
    '0_76',
    '0_77',
    '0_78',
    '0_79',
    '0_8',
    '0_81',
    '0_82',
    '0_83',
    '0_833',
    '0_84',
    '0_85',
    '0_86',
    '0_87',
    '0_88',
    '0_89',
    '0_9',
    '0_91',
    '0_92',
    '0_93',
    '0_94',
    '0_95',
    '0_96',
    '0_97',
    '0_98',
    '0_99',
    '0_995',
    '0_999',
    '1',
  ],
  DESCRIPTION_MAPPING: {
    'total_rates': 'Total rates for the',
    'total_values': 'Total values for the',
    'AIS_rates': 'AIS rates for the',
    'AIS_values': 'AIS values for the',
    'GIS_rates': 'GIS rates for the',
    'GIS_values': 'GIS values for the',
    'glaciers_rates': 'Glaciers rates for the',
    'glaciers_values': 'Glaciers values for the',
    'landwaterstorage_rates': 'Land water storage rates for the',
    'landwaterstorage_values': 'Land water storage values for the',
    'oceandynamics_rates': 'Ocean dynamics rates for the',
    'oceandynamics_values': 'Ocean dynamics values for the',
    'verticallandmotion_rates': 'Vertical land motion rates for the',
    'verticallandmotion_values': 'Vertical land motion values for the',
  },
  UNITS_MAPPING: {
    'total_rates': units.millimeter_per_year,
    'total_values': units.millimeter,
    'AIS_rates': units.millimeter_per_year,
    'AIS_values': units.millimeter,
    'GIS_rates': units.millimeter_per_year,
    'GIS_values': units.millimeter,
    'glaciers_rates': units.millimeter_per_year,
    'glaciers_values': units.millimeter,
    'landwaterstorage_rates': units.millimeter_per_year,
    'landwaterstorage_values': units.millimeter,
    'oceandynamics_rates': units.millimeter_per_year,
    'oceandynamics_values': units.millimeter,
    'verticallandmotion_rates': units.millimeter_per_year,
    'verticallandmotion_values': units.millimeter,
  },
}
