import 'binary_search_tree.dart';

void main() {
  BinarySearchTree tree = BinarySearchTree();

  tree.insert(5);
  tree.insert(3);
  tree.insert(7);
  tree.insert(2);
  tree.insert(4);
  tree.insert(6);
  tree.insert(8);
  tree.insert(9);

  print("Postorder traversal:");
  tree.postorderIterative(tree.root);

  print("\n\nPreorder traversal:");
  tree.preorderIterative(tree.root);

  print("\n\nInorder traversal:");
  tree.inorderIterative(tree.root);

  print("\n\nRoot adalah :");
  tree.getRoot();

  print("\n\ntree :");
  tree.printNode(tree.root!);

  print("\n\nHasil pencarian :");
  tree.findNode(9);
}
