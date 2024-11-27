import 'package:flutter/material.dart';

void scrollToBottom({required ScrollController scrollController}) {
  Future.delayed(const Duration(milliseconds: 100), () {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  });
}

void scrollToTop({required ScrollController scrollController}) {
  Future.delayed(const Duration(milliseconds: 100), () {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  });
}
