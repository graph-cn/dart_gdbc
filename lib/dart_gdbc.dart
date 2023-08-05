// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

library dart_gdbc;

import 'dart:collection';

part 'src/exeception/gdbc_exception.dart';
part 'src/exeception/connect_exception.dart';
part 'src/exeception/query_exception.dart';
part 'src/exeception/version_exception.dart';
part 'src/exeception/db_feature_exception.dart';

part 'src/driver_manager.dart';
part 'src/driver.dart';
part 'src/connection.dart';
part 'src/statement.dart';

part 'src/mixins/has_data_source.dart';
part 'src/mixins/has_driver.dart';
part 'src/mixins/pooled.dart';
part 'src/mixins/has_pool.dart';
part 'src/pool/pool_config.dart';
part 'src/pool/connection_pool.dart';

part 'src/result_set.dart';
part 'src/result_set_meta_data.dart';
part 'src/parameter_meta_data.dart';
part 'src/value_meta_data.dart';

part 'src/prepared_statement.dart';

part 'src/data_source.dart';
part 'src/types.dart';

// types
part 'src/types/axis_point.dart';
part 'src/types/axis_line.dart';
part 'src/types/axis_polygon.dart';
part 'src/types/gdb_entity.dart';
part 'src/types/gdb_entity_property.dart';
part 'src/types/gdb_node.dart';
part 'src/types/gdb_path.dart';
part 'src/types/gdb_relationship.dart';
part 'src/types/type.dart';
