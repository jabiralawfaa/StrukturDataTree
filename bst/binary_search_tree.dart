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
      // Print current node with decorative elements
      stdout.write(prefix);
      stdout.write(isTail ? '╰─► ' : '├─► ');

      // Add some visual styling to the node value
      stdout.write('[ ');
      stdout.writeln('${node.nodeValue} ]');

      // Collect child nodes
      final List<BstNode<T>?> children = [];
      if (node.right != null) children.add(node.right);
      if (node.left != null) children.add(node.left);

      // Print child nodes recursively
      for (int i = 0; i < children.length; i++) {
        final child = children[i];
        final isLast = i == children.length - 1;

        // Use different connecting lines for better visual hierarchy
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

  Map<String, dynamic>? _searchNode(T value) {
    BstNode<T>? node = root;
    int orderValue = 0;
    String path = "root";
    int level = 0;

    while (node != null) {
      orderValue = value.compareTo(node.nodeValue);
      if (orderValue == 0) {
        return {'node': node, 'path': path, 'level': level};
      }
      if (orderValue < 0) {
        path += " -> left";
        level++;
        node = node.left;
      } else {
        path += " -> right";
        level++;
        node = node.right;
      }
    }
    return null;
  }

  void findNode(T value) {
    final result = _searchNode(value);
    if (result != null) {
      print(
          "${result['node'].nodeValue} found at ${result['path']}, on level ${result['level']}");
    } else {
      print("$value not found in the tree");
    }
  }

  void removeNode(T value) {
    Map<String, dynamic>? result = _searchNode(value);
    if (result == null) {
      print("$value not found in the tree");
      return;
    }

    BstNode<T> node = result['node'];
    String path = result['path'];
    int level = result['level'];

    if (node.left == null && node.right == null) {
      if (path == "root") {
        root = null;
      } else if (path.endsWith("left")) {
        node.parent!.left = null;
        node.parent = null;
      } else {
        node.parent!.right = null;
        node.parent = null;
      }
    } else if (node.left != null && node.right != null) {
      BstNode<T>? successor = node.right;
      while (successor!.left != null) {
        successor = successor.left;
      }
      node.nodeValue = successor.nodeValue;
      if (successor.parent!.left == successor) {
        successor.parent!.left = successor.right;
      } else {
        successor.parent!.right = successor.right;
      }
    }
  }
}
