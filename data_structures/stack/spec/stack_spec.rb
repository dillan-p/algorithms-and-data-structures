require "spec_helper"
require "stack"

RSpec.describe Stack do
  let(:stack) { described_class.new }

  describe "#push" do
    subject(:push) { stack.push(5) }
    it "pushes a value to the stack" do
      push
      expect(stack.top.value).to eq(5)
    end
  end

  describe "#pop" do
    subject(:pop) { stack.pop }
    it "returns nil if stack is empty" do
      is_expected.to eq(nil)
    end

    it "returns the last element added" do
      stack.push(5)
      stack.push(10)
      expect(pop).to eq(10)
    end

    it "shortens the stack length" do
      2.times { stack.push(5) }
      pop
      expect(stack.top.next_node).to eq(nil)
    end
  end

  describe "#peek" do
    subject(:peek) { stack.peek }
    it "returns nil if stack is empty" do
      is_expected.to eq(nil)
    end

    it "returns the value of the top element" do
      stack.push(5)
      is_expected.to eq(5)
    end
  end

  describe "#is_empty?" do
    subject(:empty) { stack.is_empty? }
    it "returns true if stack is empty" do
      is_expected.to be true
    end

    it "returns false if stack isn't empty" do
      stack.push(5)
      is_expected.to be false
    end
  end
end
