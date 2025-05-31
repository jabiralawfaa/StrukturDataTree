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

  // Metode untuk traversal Inorder
  void inOrderDisplay(TNode<T>? node) {
    if (node != null) {
      inOrderDisplay(node.left); // Rekursi ke anak kiri
      print('${node.nodeValue}'); // Cetak nilai node saat ini
      inOrderDisplay(node.right); // Rekursi ke anak kanan
    }
  }

  // Metode untuk memulai traversal Inorder dari root
  void printInOrderFromRoot() {
    inOrderDisplay(root);
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

  // Melakukan traversal Inorder dan menampilkan hasil
  print("Inorder Traversal dari Binary Tree:");
  t.printInOrderFromRoot();
}
