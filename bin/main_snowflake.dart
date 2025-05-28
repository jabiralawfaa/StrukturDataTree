import 'snowflake.dart';

void main() {
  // membuat struktur pohon
  Snowflake<int> snowflake = Snowflake<int>();
  // mengisi nilai pada pohon
  snowflake.addSnowCore(1);
  snowflake.addSnowCore(2);
  snowflake.addSnowCore(3);
  snowflake.addSnowCore(4);
  snowflake.addSnowCore(5);
  snowflake.addSnowCore(6);
  snowflake.addSnowCore(7);
  snowflake.addSnowCore(8);
  snowflake.addSnowCore(9);
  snowflake.addSnowCore(10);
  snowflake.addSnowCore(11);
  snowflake.addSnowCore(12);
  snowflake.addSnowCore(13);
  snowflake.addSnowCore(14);
  snowflake.addSnowCore(15);

  // mencetak nilai pada pohon
  snowflake.printNode(snowflake.root!);
}