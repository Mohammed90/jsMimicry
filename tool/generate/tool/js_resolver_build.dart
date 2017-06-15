// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build/build.dart';
import 'package:wrike_ws_generate/jsmimicry_generator.dart';
import 'package:source_gen/source_gen.dart';

/// Example of how to use source_gen with [BuiltJsonGenerator].
///
/// [BuiltJsonGenerator] is usually used with [BuiltValueGenerator] and
/// [EnumClassGenerator] because types generated by these generators are
/// automatically serializable.
///
/// Import the generators you want and pass them to [build] as shown,
/// specifying which files in which packages you want to run against.
Future main(List<String> args) async {
  var phases = new PhaseGroup();
  phases.newPhase().addAction(
      new GeneratorBuilder([
        new JsMimicryGenerator()
      ], generatedExtension: '.js.g.dart'),
      new InputSet('js_mimicry', const [
        'lib/**.dart',
        'test/**.dart'
      ]));

  await build(phases, deleteFilesByDefault: true);
}