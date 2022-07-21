import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final bool _hasDestination;
  final String _label;
  final TextStyle? _style;
  final VoidCallback _onTapped;
  final NavButtonType _type;

  const NavButton({
    Key? key,
    required String label,
    required VoidCallback onTapped,
    TextStyle? style,
    bool hasDestination = false,
    NavButtonType type = NavButtonType.previous,
  })  : _label = label,
        _hasDestination = hasDestination,
        _style = style,
        _onTapped = onTapped,
        _type = type,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _hasDestination
        ? MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: _hasDestination ? _onTapped : null,
              child: SizedBox(
                width: 200,
                child: Text(
                  _label,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: _type.align,
                  style: _style,
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

enum NavButtonType {
  next(TextAlign.end),
  previous(TextAlign.start);

  final TextAlign align;
  const NavButtonType(this.align);
}
