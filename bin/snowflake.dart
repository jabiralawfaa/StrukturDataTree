class SnowflakeNode<T> {
  T nodeValue;
  SnowflakeNode<T>? firstBranch;
  SnowflakeNode<T>? secondBranch;
  SnowflakeNode<T>? thirdBranch;
  SnowflakeNode<T>? fourthBranch;
  SnowflakeNode<T>? fifthBranch;

  SnowflakeNode(this.nodeValue)
      : firstBranch = null,
        secondBranch = null,
        thirdBranch = null,
        fourthBranch = null,
        fifthBranch = null;
}

class Snowflake<T> {
  SnowflakeNode<T>? root;
  Snowflake() : root = null;

  void printNode<T>(SnowflakeNode<T> node, [int depth = 0]) {
    // Buat indentasi berdasarkan kedalaman node
    String indent = '  ' * depth;

    // Cetak nilai node dengan indentasi
    print('$indent${node.nodeValue}');

    // Cek dan cetak cabang pertama jika tidak null
    if (node.firstBranch != null) {
      printNode(node.firstBranch!, depth + 1);
    }

    // Cek dan cetak cabang kedua jika tidak null
    if (node.secondBranch != null) {
      printNode(node.secondBranch!, depth + 1);
    }

    // Cek dan cetak cabang ketiga jika tidak null
    if (node.thirdBranch != null) {
      printNode(node.thirdBranch!, depth + 1);
    }

    // Cek dan cetak cabang keempat jika tidak null
    if (node.fourthBranch!= null) {
      printNode(node.fourthBranch!, depth + 1);
    }

    // Cek dan cetak cabang kelima jika tidak null
    if (node.fifthBranch!= null) {
      printNode(node.fifthBranch!, depth + 1);
    }
  }

  void addSnowCore(T value) {
    if (root == null) {
      root = SnowflakeNode(value);
      return;
    }
    // membuat antrian untuk menyimpan node-node yang akan di proses
    List<SnowflakeNode<T>?> queue = [];
    queue.add(root);
    // melakukan perulangan selama antrian tidak kosong
    while (queue.isNotEmpty) {
      // mengambil node pertama dari antrian dan menghapusnya dari antrian
      SnowflakeNode<T>? current = queue.removeAt(0);

      // Cek ranting pertama
      if (current?.firstBranch == null) {
        current?.firstBranch = SnowflakeNode(value);
        return;
      }
      else {
        // menambahkan node anak ke antrian
        queue.add(current?.firstBranch);
      }

      // Cek ranting kedua
      if (current?.secondBranch == null) {
        current?.secondBranch = SnowflakeNode(value);
        return;
      }
      else {
        // menambahkan node anak ke antrian
        queue.add(current?.secondBranch);
      }

      // Cek ranting ketiga
      if (current?.thirdBranch == null) {
        current?.thirdBranch = SnowflakeNode(value);
        return;
      }
      else {
        // menambahkan node anak ke antrian
        queue.add(current?.thirdBranch);
      }

      // Cek ranting keempat
      if (current?.fourthBranch == null) {
        current?.fourthBranch = SnowflakeNode(value);
        return;
      }
      else {
        // menambahkan node anak ke antrian
        queue.add(current?.fourthBranch);
      }

      // Cek ranting kelima
      if (current?.fifthBranch == null) {
        current?.fifthBranch = SnowflakeNode(value);
        return;
      }
      else {
        // menambahkan node anak ke antrian
        queue.add(current?.fifthBranch);
      }
    }
  }
}