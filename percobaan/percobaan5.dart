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

  // Metode untuk traversal Inorder (dari Percobaan 2)
  void inOrderDisplay(TNode<T>? node) {
    if (node != null) {
      inOrderDisplay(node.left); // Rekursi ke anak kiri
      print('${node.nodeValue}'); // Cetak nilai node saat ini
      inOrderDisplay(node.right); // Rekursi ke anak kanan
    }
  }

  // Metode untuk traversal Preorder (dari Percobaan 3)
  void preOrderDisplay(TNode<T>? node) {
    if (node != null) {
      print('${node.nodeValue}'); // Cetak nilai node saat ini
      preOrderDisplay(node.left); // Rekursi ke anak kiri
      preOrderDisplay(node.right); // Rekursi ke anak kanan
    }
  }

  // Metode untuk traversal Postorder (dari Percobaan 4)
  void postOrderDisplay(TNode<T>? node) {
    if (node != null) {
      postOrderDisplay(node.left); // Rekursi ke anak kiri
      postOrderDisplay(node.right); // Rekursi ke anak kanan
      print('${node.nodeValue}'); // Cetak nilai node saat ini
    }
  }

  // Metode untuk menghitung kedalaman (depth) Binary Tree
  int maxDepth(TNode<T>? node) {
    if (node == null) {
      return 0; // Jika node kosong, kedalaman adalah 0
    } else {
      // Hitung kedalaman subpohon kiri dan kanan secara rekursif
      int leftDepth = maxDepth(node.left);
      int rightDepth = maxDepth(node.right);

      // Kembalikan nilai maksimum dari subpohon kiri/kanan + 1 (untuk root)
      return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1;
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

  // Menghitung dan menampilkan kedalaman Binary Tree
  print("Kedalaman Binary Tree: ${t.maxDepth(t.root)}");

  // (Opsional) Menampilkan hasil traversal untuk verifikasi struktur
  print("\nInorder Traversal dari Binary Tree:");
  t.printInOrderFromRoot();

  print("\n\nPreorder Traversal dari Binary Tree:");
  t.printPreOrderFromRoot();

  print("\n\nPostorder Traversal dari Binary Tree:");
  t.printPostOrderFromRoot();
}
