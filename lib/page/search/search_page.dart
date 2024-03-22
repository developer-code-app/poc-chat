import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/models/message.dart';
import 'package:poc_chat/page/search/bloc/search_page_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
      if (state is LoadSuccessState) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: colorScheme.inversePrimary,
            title: const Text('Search'),
          ),
          backgroundColor: Colors.grey.shade100,
          body: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView(
                      shrinkWrap: true,
                      reverse: true,
                      children: state.messages.reversed.map((message) {
                        return _buildMessage(context, state, message: message);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else if (state is LoadFailureState) {
        return Scaffold(body: Center(child: Text(state.error.toString())));
      } else {
        return Scaffold(body: Container());
      }
    });
  }

  Widget _buildMessage(
    BuildContext context,
    LoadSuccessState state, {
    required Message message,
  }) {
    final isOwner = message.owner.id == state.currentUser.id;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Align(
        alignment: isOwner ? Alignment.topRight : Alignment.topLeft,
        child: Column(
          crossAxisAlignment:
              isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            _buildUser(context, state, message: message),
            if (message is BasicMessage)
              _buildBasicMessage(context, state, message: message),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicMessage(
    BuildContext context,
    LoadSuccessState state, {
    required BasicMessage message,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isOwner = message.owner.id == state.currentUser.id;

    return Container(
      decoration: BoxDecoration(
        color: isOwner ? colorScheme.inversePrimary : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          message.text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildUser(
    BuildContext context,
    LoadSuccessState state, {
    required Message message,
  }) {
    final messages = state.messages.toList();
    final index = messages.indexOf(message);
    final previousMessage = index > 0 ? messages[index - 1] : null;

    if (previousMessage?.owner.id != message.owner.id) {
      final isOwner = message.owner.id == state.currentUser.id;

      return !isOwner
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    message.owner.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )
          : const SizedBox(height: 8);
    } else {
      return Container();
    }
  }
}
