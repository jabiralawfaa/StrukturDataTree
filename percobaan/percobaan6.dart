// Definisi kelas TNode untuk Binary Tree
class TNode<T> {
  T nodeValue;
  TNode<T>? left;
  TNode<T>? right;

  TNode(this.nodeValue)
      : left = null,
        right = null;
}

// Definisi kelas BinaryTree
class BinaryTree<T> {
  TNode<T>? root;

  BinaryTree() {
    root = null; // Inisialisasi root sebagai null
  }

  // Metode untuk traversal Inorder (Percobaan 2)
  void inOrderDisplay(TNode<T>? node) {
    if (node != null) {
      inOrderDisplay(node.left);
      print('${node.nodeValue}');
      inOrderDisplay(node.right);
    }
  }

  // Metode untuk traversal Preorder (Percobaan 3)
  void preOrderDisplay(TNode<T>? node) {
    if (node != null) {
      print('${node.nodeValue}');
      preOrderDisplay(node.left);
      preOrderDisplay(node.right);
    }
  }

  // Metode untuk traversal Postorder (Percobaan 4)
  void postOrderDisplay(TNode<T>? node) {
    if (node != null) {
      postOrderDisplay(node.left);
      postOrderDisplay(node.right);
      print('${node.nodeValue}');
    }
  }

  // Metode untuk menghitung kedalaman (depth) Binary Tree (Percobaan 5)
  int maxDepth(TNode<T>? node) {
    if (node == null) {
      return 0;
    } else {
      int leftDepth = maxDepth(node.left);
      int rightDepth = maxDepth(node.right);
      return (leftDepth > rightDepth) ? leftDepth + 1 : rightDepth + 1;
    }
  }

  // Metode untuk menghitung tinggi (height) Binary Tree
  int height(TNode<T>? node) {
    return maxDepth(node);
  }

  // Metode untuk mencetak semua node pada level tertentu
  void printCurrentLevel(TNode<T>? node, int level) {
    if (node != null) {
      if (level == 0) {
        print('${node.nodeValue}');
      } else if (level > 0) {
        printCurrentLevel(node.left, level - 1);
        printCurrentLevel(node.right, level - 1);
      }
    }
  }

  // Metode untuk mencetak Level Order Traversal
  void printLevelOrder() {
    int h = height(root);
    print("Level Order Traversal dari Binary Tree:");
    for (int i = 0; i < h; i++) {
      printCurrentLevel(root, i);
    }
  }

  // Metode untuk memulai traversal Inorder dari root
  void printInOrderFromRoot() {
    inOrderDisplay(root);
  }

  // Metode untuk memulai traversal Preorder dari root
  void printPreOrderFromRoot() {
    preOrderDisplay(root);
  }

  // Metode untuk memulai traversal Postorder dari root
  void printPostOrderFromRoot() {
    postOrderDisplay(root);
  }
}

void main() {
  // Membuat objek BinaryTree
  BinaryTree<int> t = BinaryTree<int>();

  // Membangun Binary Tree secara manual (seperti pada Percobaan 1)
  t.root = TNode<int>(10); // Node akar
  t.root!.left = TNode<int>(20); // Anak kiri dari root
  t.root!.right = TNode<int>(30); // Anak kanan dari root
  t.root!.right!.left = TNode<int>(4); // Anak kiri dari node 30

  // Menjalankan Level Order Traversal
  t.printLevelOrder();

  // (Opsional) Menampilkan hasil traversal lainnya
  print("\nInorder Traversal dari Binary Tree:");
  t.printInOrderFromRoot();

  print("\nPreorder Traversal dari Binary Tree:");
  t.printPreOrderFromRoot();

  print("\nPostorder Traversal dari Binary Tree:");
  t.printPostOrderFromRoot();
}
