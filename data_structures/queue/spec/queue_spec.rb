require "spec_helper"
require "queue"

RSpec.describe Queue do
  subject(:queue) { described_class.new }

  describe "#enqueue" do
    let(:value) { 5 }
    subject(:enqueue) { queue.enqueue(value) }

    it "queues the value to an empty queue" do
      enqueue
      expect(queue.head.value).to eq(5)
      expect(queue.tail.value).to eq(5)
    end

    it "queues the value to a list with values" do
      enqueue
      queue.enqueue(10)
      expect(queue.head.value).to eq(5)
      expect(queue.tail.value).to eq(10)
    end
  end

  describe "#dequeue" do
    subject(:dequeue) { queue.dequeue }
    it "returns nil if list is empty" do
      is_expected.to eq(nil)
    end

    it "returns value and sets head and tail to nil if only one node" do
      queue.enqueue(5)
      is_expected.to eq(5)
      expect(queue.head).to eq(nil)
      expect(queue.tail).to eq(nil)
    end

    it "returns value and sets head to the next node" do
      queue.enqueue(5)
      queue.enqueue(10)
      is_expected.to eq(5)
      expect(queue.head.value).to eq(10)
      expect(queue.tail.value).to eq(10)
    end
  end
end
