import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';

extension ContextExtentions on BuildContext {
  _CustomContextExtentions get customSized => _CustomContextExtentions(this);
}

class _CustomContextExtentions {
  _CustomContextExtentions(BuildContext context) : _context = context;
  final BuildContext _context;

  double get height => _context.general.mediaSize.height;

  double get width => _context.general.mediaSize.width;

  double get mediumHighValue => height * 0.06;
}
