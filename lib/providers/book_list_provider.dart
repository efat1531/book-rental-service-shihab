import 'dart:math';

import 'package:flutter/widgets.dart';

import '../models/book_provider.dart';

class BookListProvider with ChangeNotifier {
  final List<BookItem> _bookList = [
    BookItem(
      id: 'B1',
      title: 'Harry Potter and Philosopher Stone',
      authorName: 'J. K. Rowling',
      amount: 100,
      description: 'This is first book of harry potter',
      quantity: 10,
      category: Categories.fiction,
      imageUrl:
          'https://i.ibb.co/997Rp8h/Harry-Potter-and-the-Philosopher-s-Stone-Book-Cover.jpg',
      bookSold: 0,
    ),
    BookItem(
      id: 'B2',
      title: 'The Psychology of Stupidity',
      authorName: 'Jean-Francois Marmion',
      amount: 100,
      description:
          'Stupidity is all around us, from the colleagues who won’t stop hitting reply all to the former school friends posting conspiracy theories on Facebook. But in order to battle idiocy, we must first understand it. In The Psychology of Stupidity, some of the world’s leading psychologists and thinkers – including a Nobel Prize winner – will show you . . .',
      quantity: 10,
      category: Categories.nonfiction,
      imageUrl: 'https://i.ibb.co/kBLCck7/The-Psychology.png',
      bookSold: 1,
    ),
    BookItem(
      id: 'B3',
      title: 'Harry Potter and the Chamber of Secrets',
      authorName: 'J. K. Rowling',
      amount: 100,
      description:
          'The second instalment of boy wizard Harry Potter\'s adventures at Hogwarts School of Witchcraft and Wizardry, based on the novel by JK Rowling. A mysterious elf tells Harry to expect trouble during his second year at Hogwarts, but nothing can prepare him for trees that fight back, flying cars, spiders that talk and deadly warnings written in blood on the walls of the school.',
      quantity: 10,
      category: Categories.fiction,
      imageUrl:
          'https://i.ibb.co/xLJDpQV/Harry-Potter-and-the-Chamber-of-Secrets.jpg',
      bookSold: 1,
    ),
    BookItem(
      id: 'B4',
      title: 'Harry Potter and the Prisoner of Azkaban',
      authorName: 'J. K. Rowling',
      amount: 100,
      description:
          'The book follows Harry Potter, a young wizard, in his third year at Hogwarts School of Witchcraft and Wizardry. Along with friends Ronald Weasley and Hermione Granger, Harry investigates Sirius Black, an escaped prisoner from Azkaban, the wizard prison, believed to be one of Lord Voldemort\'s old allies.',
      quantity: 5,
      category: Categories.fiction,
      imageUrl:
          'https://i.ibb.co/LSt7Xcd/Harry-Potter-and-the-Prisoner-of-Azkaban.jpg',
      bookSold: 3,
    ),
    BookItem(
      id: 'B5',
      title: 'Fans',
      authorName: 'Michael Bond',
      amount: 100,
      description:
          'Fans takes the reader on a journey through a constellation of fandoms, and along the way demonstrates some fundamental truths about the human condition.',
      quantity: 10,
      category: Categories.nonfiction,
      imageUrl: 'https://i.ibb.co/6Xmy1vS/Fans.png',
      bookSold: 0,
    ),
    BookItem(
      id: 'B6',
      title: 'The Book of Minds',
      authorName: 'Philip Ball',
      amount: 100,
      description:
          'Understanding the human mind and how it relates to the world of experience has challenged scientists and philosophers for centuries. How do we even begin to think about ‘minds’ that are not human? That is the question explored in this ground-breaking book. In The Book of Minds, Award-winning science writer Philip Ball argues that in order to understand our own minds and imagine those of others, we need to move on from considering the human mind as a standard against which all others should be measured.',
      quantity: 10,
      category: Categories.nonfiction,
      imageUrl: 'https://i.ibb.co/wzStfXz/The-Book-of-Minds.png',
      bookSold: 1,
    ),
    BookItem(
      id: 'B7',
      title: 'Misir Ali',
      authorName: 'Humayun Ahmed',
      amount: 200,
      description:
          'Misir Ali is intelligent and often seen solving mysteries, although never accepting money for them. He is a logical person and doesn\'t believe in any paranormal activities. He has a personal diary named \'UNSOLVED,\' in which he writes about those mysteries not solved by him.',
      quantity: 10,
      category: Categories.fiction,
      imageUrl: 'https://i.ibb.co/Mhr1k0k/Misir-Ali.jpg',
      bookSold: 10,
    ),
    BookItem(
      id: 'B8',
      title: 'Introduction to the Theory of Computation',
      authorName: 'Michael Sipser',
      amount: 200,
      description:
          'Theory of computation (TOC) is a branch of Computer Science that is concerned with how problems can be solved using algorithms and how efficiently they can be solved. Real-world computers perform computations that by nature run like mathematical models to solve problems in systematic ways.',
      quantity: 10,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/sFtJFrz/TOC.jpg',
      bookSold: 2,
    ),
    BookItem(
      id: 'B9',
      title: 'Introduction to Computer Graphics',
      authorName: 'David J. Eck',
      amount: 200,
      description:
          'Introduction to Computer Graphics is a free, on-line textbook covering the fundamentals of computer graphics and computer graphics programming. This book is meant for use as a textbook in a one-semester course that would typically be taken by undergraduate computer science majors in their third or fourth year of college.',
      quantity: 10,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/6N4jPMz/Computer-Graphics.png',
      bookSold: 15,
    ),
    BookItem(
      id: 'B10',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B11',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B12',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B13',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B14',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B15',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B16',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B17',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B18',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B19',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
    BookItem(
      id: 'B20',
      title: 'Programming in ANSI C',
      authorName: 'E. Balagurusamy',
      amount: 200,
      description:
          'In keeping with the original essence of this distinguished bestseller, the sixth edition presents C programming concepts in a simple, clear and logical order, thus making it ideal for novices. This text uses sample programs, case studies, programming problems, projects and many more pedagogical aids to enable better understanding of the C language. The hallmark of this edition is its new avatar in color, to enhance visual appeal and make learning a pleasure!',
      quantity: 1,
      category: Categories.education,
      imageUrl: 'https://i.ibb.co/KhmZ6wb/ANSI-C.jpg',
      bookSold: 20,
    ),
  ];

  List<BookItem> get bookList {
    return [..._bookList];
  }

  List<BookItem> get educationBookList {
    return _bookList
        .where((element) => element.category == Categories.education)
        .toList();
  }

  List<BookItem> get nonfictionBookList {
    return _bookList
        .where((element) => element.category == Categories.nonfiction)
        .toList();
  }

  List<BookItem> get fictionBookList {
    return _bookList
        .where((element) => element.category == Categories.fiction)
        .toList();
  }

  List<BookItem> get popularList {
    final orginalList = _bookList.toList();
    orginalList.sort(((b, a) => a.bookSold.compareTo(b.bookSold)));
    orginalList.where((element) => element.bookSold > 0).toList();
    List<BookItem> returnList =
        orginalList.take(min(10, orginalList.length)).toList();
    return returnList;
  }

  List<BookItem> searchBook(String inputText) {
    final suggestBooks = _bookList.where(
      (element) {
        final bookTitle = element.title.toLowerCase();
        final input = inputText.toLowerCase();
        return bookTitle.contains(input);
      },
    ).toList();
    return suggestBooks;
  }

  BookItem getItemById(String id) {
    return _bookList.firstWhere((element) => element.id == id);
  }

  List<BookItem> similarBookList(BookItem receivedBook) {
    final orginalList = _bookList
        .where((element) => element.category == receivedBook.category)
        .toList();
    orginalList.shuffle();
    orginalList.removeWhere((element) => element.id == receivedBook.id);
    List<BookItem> returnList =
        orginalList.take(min(10, orginalList.length)).toList();
    return returnList;
  }

  List<BookItem> get favourites {
    return _bookList.where((element) => element.isFavourite == true).toList();
  }
}
