require "spec_helper"
require "linked_list"

RSpec.describe LinkedList do
  let(:linked_list) { described_class.new }

  describe "#prepends" do
    context "when heads is nil" do
      it "adds element" do
        linked_list.prepends(5)
        expect(linked_list.head.value).to eq(5)
      end
    end

    context "when heads isn't nil" do
      it "adds element to the front" do
        linked_list.prepends(5)
        linked_list.prepends(10)
        expect(linked_list.head.value).to eq(10)
        expect(linked_list.head.next_node.value).to eq(5)
      end
    end
  end

  describe "#appends" do
    context "when heads is nil" do
      it "adds element" do
        linked_list.appends(5)
        expect(linked_list.head.value).to eq(5)
      end
    end

    context "when heads isn't nil" do
      it "adds element to the end" do
        linked_list.appends(5)
        linked_list.appends(10)
        expect(linked_list.head.value).to eq(5)
        expect(linked_list.head.next_node.value).to eq(10)
      end
    end
  end

  describe "#find" do
    let(:entry) { 5 }
    subject(:find) { linked_list.find(entry) }

    context "when list is empty" do
      it { is_expected.to eq(nil) }
    end

    context "when list isn't empty" do
      it "returns the node" do
        linked_list.appends(10)
        linked_list.appends(7)
        linked_list.appends(5)
        expect(find).to eq(linked_list.head.next_node.next_node)
      end

      it "returns nil if entry isn't in the list" do
        linked_list.appends(7)
        expect(find).to eq(nil)
      end
    end
  end

  describe "#delete" do
    let(:entry) { 5 }
    let(:length) { linked_list.length }
    subject(:delete) { linked_list.delete(entry) }

    context "when list is empty" do
      it "is expected to have a length of 0" do
        delete
        expect(length).to eq(0)
      end
    end

    context "when list isn't empty" do
      it "deletes the node if its value matches the entry at the head" do
        5.times { linked_list.appends(5) }
        delete
        expect(length).to eq(4)
      end

      it "deletes the node if it is further in the list" do
        5.times { linked_list.appends(6) }
        linked_list.appends(5)
        4.times { linked_list.appends(6) }
        delete
        expect(length).to eq(9)
      end
    end
  end

  describe "#length" do
    subject(:length) { linked_list.length }

    context "when list is empty" do
      it { is_expected.to eq(0) }
    end

    context "when list isn't empty" do
      it "returns list length" do
        10.times { linked_list.appends(5) }
        is_expected.to eq(10)
      end
    end
  end
end
