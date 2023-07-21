import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flashcards_quiz/views/buttons.dart';
import 'package:flashcards_quiz/views/example_cards.dart';
import 'package:flashcards_quiz/views/model.dart';
import 'package:flutter/cupertino.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  MyCustomWidgetState createState() => MyCustomWidgetState();
}

class MyCustomWidgetState extends State<MyCustomWidget> {
  final AppinioSwiperController controller = AppinioSwiperController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.70,
            child: AppinioSwiper(
              loop: true,
              backgroundCardsCount: 2,
              swipeOptions: const AppinioSwipeOptions.all(),
              unlimitedUnswipe: true,
              controller: controller,
              unswipe: _unswipe,
              onSwiping: (AppinioSwiperDirection direction) {
                print("${direction.index}");
                debugPrint(direction.toString());
              },
              onSwipe: _swipe,
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 50,
                bottom: 40,
              ),
              onEnd: _onEnd,
              cardsCount: candidates.length,
              cardsBuilder: (BuildContext context, int index) {
                var cardIndex = candidates[index];
                print(index);
                return ExampleCard(
                  candidate: cardIndex,
                  tap: () {
                    print(cardIndex.name);
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          unswipeButton(controller)
        ],
      ),
    );
  }
}

void _swipe(int index, AppinioSwiperDirection direction) {
  print("the card was swiped to the: ${direction.name}");
  print(index);
}

void _unswipe(bool unswiped) {
  if (unswiped) {
    print("SUCCESS: card was unswiped");
  } else {
    print("FAIL: no card left to unswipe");
  }
}

void _onEnd() {
  print("end reached!");
}
