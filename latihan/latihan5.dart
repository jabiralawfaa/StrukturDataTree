// Latihan 5: Diagram rekursif untuk menghitung kedalaman Binary Tree

// Definisi kelas TNode untuk Binary Tree
class TNode<T> {
  T nodeValue;
  TNode<T>? left;
  TNode<T>? right;
  String label; // Label untuk node (root, p, r, q)

  TNode(this.nodeValue, this.label)
      : left = null,
        right = null;
}

// Definisi kelas BinaryTree
class BinaryTree<T> {
  TNode<T>? root;

  BinaryTree() {
    root = null; // Inisialisasi root sebagai null
  }

  // Metode untuk menambahkan node berdasarkan level order (breadth-first)
  void addNodeLevelOrder(T value, String label) {
    // Membuat node baru
    TNode<T> newNode = TNode<T>(value, label);

    // Jika root kosong, jadikan node baru sebagai root
    if (root == null) {
      root = newNode;
      return;
    }

    // Menggunakan List sebagai queue untuk traversal level order
    List<TNode<T>> queue = [];
    queue.add(root!);

    // Melakukan traversal level order
    while (queue.isNotEmpty) {
      TNode<T> temp = queue.removeAt(0); // Dequeue

      // Jika anak kiri kosong, tambahkan node baru di sini
      if (temp.left == null) {
        temp.left = newNode;
        return;
      } else {
        // Jika anak kiri tidak kosong, tambahkan ke queue
        queue.add(temp.left!);
      }

      // Jika anak kanan kosong, tambahkan node baru di sini
      if (temp.right == null) {
        temp.right = newNode;
        return;
      } else {
        // Jika anak kanan tidak kosong, tambahkan ke queue
        queue.add(temp.right!);
      }
    }
  }

  // Metode untuk mencetak tree dalam level order (breadth-first)
  void printLevelOrder() {
    if (root == null) {
      print("Tree kosong");
      return;
    }

    List<TNode<T>> queue = [];
    queue.add(root!);

    print("Level Order Traversal:");
    while (queue.isNotEmpty) {
      TNode<T> temp = queue.removeAt(0);
      print("${temp.nodeValue} (${temp.label})");

      if (temp.left != null) {
        queue.add(temp.left!);
      }

      if (temp.right != null) {
        queue.add(temp.right!);
      }
    }
  }

  // Metode untuk menghitung kedalaman (depth) Binary Tree
  int maxDepth(TNode<T>? node) {
    if (node == null) {
      return 0;
    } else {
      // Hitung kedalaman subtree kiri
      int leftDepth = maxDepth(node.left);
      // Hitung kedalaman subtree kanan
      int rightDepth = maxDepth(node.right);
      // Kembalikan nilai maksimum dari kedalaman kiri dan kanan, ditambah 1 untuk level saat ini
      return (leftDepth > rightDepth) ? leftDepth + 1 : rightDepth + 1;
    }
  }

  // Metode untuk menampilkan diagram rekursif dari perhitungan kedalaman
  void showDepthCalculation(TNode<T>? node, String indent) {
    if (node == null) {
      print("${indent}null → 0");
      return;
    }

    print("${indent}Node ${node.nodeValue} (${node.label}):");

    // Rekursif ke subtree kiri
    print("${indent}  Kedalaman kiri:");
    showDepthCalculation(node.left, "${indent}    ");

    // Rekursif ke subtree kanan
    print("${indent}  Kedalaman kanan:");
    showDepthCalculation(node.right, "${indent}    ");

    // Hitung kedalaman
    int leftDepth = maxDepth(node.left);
    int rightDepth = maxDepth(node.right);
    int nodeDepth = (leftDepth > rightDepth) ? leftDepth + 1 : rightDepth + 1;

    print(
        "${indent}  Kedalaman node ${node.nodeValue} = max(${leftDepth}, ${rightDepth}) + 1 = ${nodeDepth}");
  }

  // Metode untuk memulai perhitungan kedalaman dari root
  void calculateDepthFromRoot() {
    print("\nDiagram Rekursif Perhitungan Kedalaman Binary Tree:\n");
    showDepthCalculation(root, "");
    print("\nKedalaman total Binary Tree: ${maxDepth(root)}");
  }
}

void main() {
  // Membuat objek BinaryTree
  BinaryTree<int> t = BinaryTree<int>();

  // Membangun Binary Tree sesuai dengan gambar
  t.root = TNode<int>(10, "root"); // Node akar dengan nilai 10
  t.root!.left = TNode<int>(20, "p"); // Anak kiri dari root dengan nilai 20
  t.root!.right = TNode<int>(30, "r"); // Anak kanan dari root dengan nilai 30
  t.root!.right!.left =
      TNode<int>(40, "q"); // Anak kiri dari node 30 dengan nilai 40

  // Menampilkan struktur pohon
  print("Struktur Binary Tree:");
  print("Root: ${t.root!.nodeValue} (${t.root!.label})");
  print(
      "Left Child of Root: ${t.root!.left!.nodeValue} (${t.root!.left!.label})");
  print(
      "Right Child of Root: ${t.root!.right!.nodeValue} (${t.root!.right!.label})");
  print(
      "Left Child of Right Child: ${t.root!.right!.left!.nodeValue} (${t.root!.right!.left!.label})");

  // Menjalankan perhitungan kedalaman dengan diagram rekursif
  t.calculateDepthFromRoot();

  // Demonstrasi penambahan node dengan level order
  print("\n=== Demonstrasi Penambahan Node dengan Level Order ===\n");

  // Membuat tree baru untuk demonstrasi
  BinaryTree<int> levelOrderTree = BinaryTree<int>();

  // Menambahkan node secara level order
  levelOrderTree.addNodeLevelOrder(10, "root");
  levelOrderTree.addNodeLevelOrder(20, "p");
  levelOrderTree.addNodeLevelOrder(30, "r");
  levelOrderTree.addNodeLevelOrder(40, "q");
  levelOrderTree.addNodeLevelOrder(50, "s");
  levelOrderTree.addNodeLevelOrder(60, "t");

  // Mencetak tree dalam level order
  levelOrderTree.printLevelOrder();

  // Menghitung dan menampilkan kedalaman tree
  print(
      "\nKedalaman total Binary Tree (level order): ${levelOrderTree.maxDepth(levelOrderTree.root)}");

  // Menampilkan diagram rekursif untuk tree yang dibuat dengan level order
  print("\nDiagram Rekursif untuk Tree yang Dibuat dengan Level Order:\n");
  levelOrderTree.showDepthCalculation(levelOrderTree.root, "");
}
