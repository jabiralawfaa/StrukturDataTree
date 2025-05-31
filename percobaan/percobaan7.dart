import 'dart:collection'; // Untuk menggunakan Queue

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

  // Metode untuk mencetak semua node pada level tertentu (Percobaan 6)
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

  // Metode untuk Level Order Traversal (Percobaan 6)
  void printLevelOrder() {
    int h = maxDepth(root);
    print("Level Order Traversal dari Binary Tree:");
    for (int i = 0; i < h; i++) {
      printCurrentLevel(root, i);
    }
  }

  // Metode untuk menghapus node terdalam (deleteDeepest)
  void deleteDeepest(TNode<T> root, TNode<T> delNode) {
    if (root == null) return;

    Queue<TNode<T>> queue = Queue();
    queue.add(root);

    while (queue.isNotEmpty) {
      TNode<T> temp = queue.removeFirst();

      // Hapus referensi ke node yang akan dihapus
      if (temp.left != null) {
        if (temp.left == delNode) {
          temp.left = null;
          return;
        } else {
          queue.add(temp.left!);
        }
      }

      if (temp.right != null) {
        if (temp.right == delNode) {
          temp.right = null;
          return;
        } else {
          queue.add(temp.right!);
        }
      }
    }
  }

  // Metode untuk menghapus node dengan nilai tertentu (delete)
  void delete(TNode<T>? root, T key) {
    if (root == null) return;

    Queue<TNode<T>> queue = Queue();
    queue.add(this.root!);

    TNode<T>? keyNode;
    TNode<T>? temp;

    while (queue.isNotEmpty) {
      temp = queue.removeFirst();

      if (temp.nodeValue == key) {
        keyNode = temp;
      }

      if (temp.left != null) queue.add(temp.left!);
      if (temp.right != null) queue.add(temp.right!);
    }

    if (keyNode != null && temp != null) {
      T value = temp.nodeValue; // Ambil nilai node terdalam
      deleteDeepest(this.root!, temp); // Hapus node terdalam
      keyNode.nodeValue = value; // Ganti nilai node yang dihapus
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

  // Menampilkan struktur awal dengan Level Order Traversal
  print("Struktur awal Binary Tree (Level Order):");
  t.printLevelOrder();

  // Menghapus node dengan nilai 30
  t.delete(t.root, 30);
  print("\nSetelah menghapus node bernilai 30:");

  // Menampilkan struktur akhir dengan Level Order Traversal
  print("\nStruktur akhir Binary Tree (Level Order):");
  t.printLevelOrder();

  // Menampilkan hasil traversal Inorder untuk verifikasi
  print("\nInorder Traversal setelah penghapusan:");
  t.printInOrderFromRoot();
}
