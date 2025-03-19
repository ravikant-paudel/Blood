// Copyright (c) 2020 The Khalti Authors. All rights reserved.
import 'dart:math' as math;

import 'package:blood/utils/empty_util.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:flutter/material.dart';

class BloodListView extends StatelessWidget {
  final SliverChildDelegate _childDelegate;

  /// Widget at the bottom of the list view.
  final Widget? bottom;

  final RefreshCallback? onRefresh;

  final VoidCallback? onLoadMore;

  final bool isLoadingMore;

  /// Widget at the top of the list view
  final Widget? header;

  /// Padding for the [children].
  ///
  /// Default is 16.0 on all direction.
  final EdgeInsetsGeometry padding;

  final bool shrinkWrap;
  final ScrollPhysics? physics;

  final Axis scrollDirection;

  final ScrollController? controller;

  BloodListView({
    super.key,
    required List<Widget> children,
    this.header,
    this.bottom,
    this.onRefresh,
    this.onLoadMore,
    this.isLoadingMore = false,
    this.padding = const EdgeInsets.all(d_margin2),
    this.controller,
    this.shrinkWrap = false,
    this.physics,
    this.scrollDirection = Axis.vertical,
  }) : _childDelegate = SliverChildListDelegate(children);

  BloodListView.builder({
    super.key,
    required IndexedWidgetBuilder itemBuilder,
    required int itemCount,
    this.header,
    this.bottom,
    this.onRefresh,
    this.onLoadMore,
    this.isLoadingMore = false,
    this.padding = const EdgeInsets.all(d_margin2),
    this.controller,
    this.shrinkWrap = false,
    this.physics,
    this.scrollDirection = Axis.vertical,
  }) : _childDelegate = SliverChildBuilderDelegate(itemBuilder, childCount: itemCount);

  BloodListView.separated({
    super.key,
    required IndexedWidgetBuilder itemBuilder,
    required IndexedWidgetBuilder separatedBuilder,
    required int itemCount,
    this.header,
    this.bottom,
    this.onRefresh,
    this.onLoadMore,
    this.isLoadingMore = false,
    this.padding = const EdgeInsets.all(d_margin2),
    this.controller,
    this.shrinkWrap = false,
    this.physics,
    this.scrollDirection = Axis.vertical,
  }) : _childDelegate = SliverChildBuilderDelegate(
          (context, index) {
            final itemIndex = index ~/ 2;
            return index.isEven ? itemBuilder(context, itemIndex) : separatedBuilder(context, itemIndex);
          },
          childCount: math.max(0, itemCount * 2 - 1),
          semanticIndexCallback: (_, index) => index.isEven ? index ~/ 2 : null,
        );

  @override
  Widget build(BuildContext context) {
    Widget child = CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      controller: controller,
      shrinkWrap: shrinkWrap,
      physics: physics,
      scrollDirection: scrollDirection,
      slivers: [
        if (header.isNotNull) SliverToBoxAdapter(child: header),
        SliverPadding(
          padding: padding,
          sliver: SliverList(delegate: _childDelegate),
        ),
        if (onLoadMore.isNotNull)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: d_margin2, horizontal: d_margin6),
              child: isLoadingMore
                  ? LinearProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        if (bottom.isNotNull)
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: bottom,
            ),
          ),
      ],
    );

    if (onLoadMore.isNotNull) {
      child = NotificationListener<ScrollEndNotification>(
        onNotification: (scrollNotification) {
          final scrollMetrics = scrollNotification.metrics;
          final hasReachedEnd = scrollMetrics.pixels == scrollMetrics.maxScrollExtent;
          if (hasReachedEnd) onLoadMore!();
          return false;
        },
        child: child,
      );
    }

    if (onRefresh.isNull) return child;

    return RefreshIndicator(onRefresh: onRefresh!, child: child);
  }
}
