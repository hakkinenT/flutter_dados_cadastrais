import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/spaces.dart';

class EmptyRegisterList extends StatelessWidget {
  const EmptyRegisterList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const _EmptyRegisterBody(
      children: [
        _EmptyImage(),
        SizedBox(
          height: 24,
        ),
        _EmptyMessage(),
      ],
    );
  }
}

class _EmptyRegisterBody extends StatelessWidget {
  const _EmptyRegisterBody({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalSpace,
        horizontal: paddingSpace,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  final double verticalSpace = paddingSpace * 4;
}

class _EmptyMessage extends StatelessWidget {
  const _EmptyMessage();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Ainda não há nada aqui. ',
        style: titleStyle,
        children: [
          TextSpan(
            text: '\nClique no botão ',
            style: subtitleStyle,
          ),
          TextSpan(
            text: 'Adicionar ',
            style: addWordStyle(context),
          ),
          TextSpan(text: 'para começar!', style: subtitleStyle)
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  final TextStyle subtitleStyle = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );

  final TextStyle titleStyle = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle addWordStyle(BuildContext context) => TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      );
}

class _EmptyImage extends StatelessWidget {
  const _EmptyImage();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: SvgPicture.asset(
        'assets/no_data.svg',
      ),
    );
  }
}
