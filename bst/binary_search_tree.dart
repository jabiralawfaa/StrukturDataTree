import 'dart:io';

class BstNode<T> {
  T nodeValue;
  BstNode<T>? left;
  BstNode<T>? right;
  BstNode<T>? parent;

  BstNode(this.nodeValue, this.parent);
}

class BinarySearchTree<T extends Comparable> {
  BstNode<T>? root;
  int treeSize = 0;

  void preorderIterative(BstNode<T>? node) {
    if (node == null) return;
    List<BstNode<T>?> stack = [];
    stack.add(node);
    while (stack.isNotEmpty) {
      BstNode<T>? current = stack.removeLast();
      stdout.write("${current!.nodeValue} ");
      if (current.right != null) {
        stack.add(current.right);
      }
      if (current.left != null) {
        stack.add(current.left);
      }
    }
    print("");
  }

  void postorderIterative(BstNode<T>? node) {
    if (node == null) return;
    List<BstNode<T>?> stack1 = [];
    List<BstNode<T>?> stack2 = [];
    stack1.add(node);
    while (stack1.isNotEmpty) {
      BstNode<T>? current = stack1.removeLast();
      stack2.add(current);
      if (current!.left != null) {
        stack1.add(current.left);
      }
      if (current.right != null) {
        stack1.add(current.right);
      }
    }
    while (stack2.isNotEmpty) {
      stdout.write("${stack2.removeLast()!.nodeValue} ");
    }
  }

  void inorderIterative(BstNode<T>? node) {
    if (node == null) return;
    List<BstNode<T>?> stack = [];
    BstNode<T>? current = node;

    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }

      current = stack.removeLast();
      stdout.write("${current!.nodeValue} ");
      current = current!.right;
    }
    print("");
  }

  void getRoot() {
    print(root!.nodeValue);
  }

  printNode<T>(BstNode<T>? node, [String prefix = '', bool isTail = true]) {
    if (node != null) {
      stdout.write(prefix);
      stdout.write(isTail ? '└── ' : '├── ');
      stdout.writeln(node.nodeValue);

      final List<BstNode<T>?> children = [];
      if (node.right != null) children.add(node.right);
      if (node.left != null) children.add(node.left);

      for (int i = 0; i < children.length; i++) {
        final child = children[i];
        final isLast = i == children.length - 1;

        printNode(
          child,
          prefix + (isTail ? '    ' : '│   '),
          isLast,
        );
      }
    }
  }

  bool insert(T value) {
    BstNode<T>? node = root, parent;
    int orderValue = 0;

    while (node != null) {
      parent = node;
      orderValue = value.compareTo(node.nodeValue);
      if (orderValue == 0) {
        return false;
      } else if (orderValue < 0) {
        node = node.left;
      } else {
        node = node.right;
      }
    }

    BstNode<T>? newNode = BstNode<T>(value, parent);

    if (parent == null) {
      root = newNode;
    } else if (orderValue < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }

    treeSize++;
    return true;
  }
}
