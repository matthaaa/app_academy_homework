require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Gordon") }
  subject(:dessert) { Dessert.new("ice cream", 100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("ice cream")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {
        Dessert.new("cookie", "a dozen", :chef)
      }.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      (dessert.ingredients).should_not include("flour")
      dessert.add_ingredient("flour")
      (dessert.ingredients).should include("flour")
    end
  end

  describe "#mix!" do
    before(:each) do
      dessert.add_ingredient("flour")
      dessert.add_ingredient("milk")
      dessert.add_ingredient("water")
      dessert.add_ingredient("chocolate")
      dessert.add_ingredient("yeast")
      dessert.add_ingredient("eggs")
      dessert.add_ingredient("chicken?")
      dessert.add_ingredient("butter")
      dessert.add_ingredient("vanilla extract")
    end

    let (:ingredients) {dessert.ingredients}

    it "shuffles the ingredient array" do
      expect(dessert.mix!).to_not eq(:ingredients)
    end
  end

  describe "#eat" do
    subject(:dessert) { Dessert.new("ice cream", 10, chef) }
    let (:amount) {dessert.quantity}
    before(:each) do
      dessert.eat(5)
    end
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(100)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    subject(:dessert) { Dessert.new("ice cream", 10, chef) }
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Gordon the Great Baker")
      expect(dessert.serve).to eq("Chef Gordon the Great Baker has made 10 ice creams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
