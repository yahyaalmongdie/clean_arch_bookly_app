  import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData({required List<BookEntity> books,required  boxName}) {
     var box = Hive.box<BookEntity>(boxName);
    box.addAll(books);
  }