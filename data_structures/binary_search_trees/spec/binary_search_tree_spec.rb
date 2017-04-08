require "spec_helper"
require "binary_search_tree"

RSpec.describe BinarySearchTree do
  subject(:binary) { described_class.new }

  describe "#insert" do
    context "when root is empty" do
      it "adds node to root" do
        binary.insert(5)
        expect(binary.root.value).to eq(5)
      end
    end
  end

  describe "#insert_recursive" do
    context "when value is less than parent value" do
      it "makes value the left child of the parent when root has one child" do
        binary.insert(5)
        binary.insert(3)
        expect(binary.root.left_child.value).to eq(3)
        expect(binary.root.left_child.parent.value).to eq(5)
      end

      it "makes value the left child of the parent when root has multiple children" do
        5.times { binary.insert(5) }
        binary.insert(3)
        expect(binary.root.left_child.left_child.left_child.left_child.left_child.value).to eq(3)
        expect(binary.root.left_child.left_child.left_child.left_child.left_child.parent.value).to eq(5)
      end
    end

    context "when value is equal to parent value" do
      it "makes value the left child of the parent" do
        binary.insert(5)
        binary.insert(5)
        expect(binary.root.left_child.value).to eq(5)
        expect(binary.root.left_child.parent.value).to eq(5)
      end
    end

    context "when value is greater than parent value" do
      it "makes value the right child of the parent when root has one child" do
        binary.insert(3)
        binary.insert(5)
        expect(binary.root.right_child.value).to eq(5)
        expect(binary.root.right_child.parent.value).to eq(3)
      end

      it "makes value the left child of the parent when root has multiple children" do
        (1..5).each { |i| binary.insert(i) }
        binary.insert(6)
        expect(binary.root.right_child.right_child.right_child.right_child.right_child.value).to eq(6)
        expect(binary.root.right_child.right_child.right_child.right_child.right_child.parent.value).to eq(5)
      end
    end
  end
end
