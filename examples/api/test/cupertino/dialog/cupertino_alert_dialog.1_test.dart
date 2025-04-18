// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_api_samples/cupertino/dialog/cupertino_alert_dialog.1.dart' as example;

void main() {
  testWidgets('Check for Directionality', (WidgetTester tester) async {
    const String actionText = 'Yes';
    await tester.pumpWidget(const example.AlertDialogApp());

    // Launch the CupertinoAlertDialog.
    await tester.tap(find.text('CupertinoAlertDialog'));
    await tester.pump();
    await tester.pumpAndSettle();
    expect(find.text(actionText), findsOneWidget);
    var yesButton =
    tester
        .firstRenderObject(find.text('Yes'))
        .getTransformTo(null)
        .getTranslation();
    var noButton =
    tester
        .firstRenderObject(find.text('No'))
        .getTransformTo(null)
        .getTranslation();
    await tester.tap(find.text('Yes'));
    await tester.pump();
    await tester.pumpAndSettle();
    expect(yesButton.x > noButton.x, true);
    await tester.tap(find.text('Language'));
    await tester.tap(find.text('CupertinoAlertDialog'));
    await tester.pump();
    await tester.pumpAndSettle();
    await tester.pump();
    yesButton =
        tester
            .firstRenderObject(find.text('Yes'))
            .getTransformTo(null)
            .getTranslation();
    noButton =
        tester
            .firstRenderObject(find.text('No'))
            .getTransformTo(null)
            .getTranslation();
    expect(yesButton.x > noButton.x, false);
  });
}
