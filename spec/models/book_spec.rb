require "rails_helper"

RSpec.describe Book, type: :model do
  # Test for title attribute
  describe "title" do
    it "is valid with a title" do
      book = Book.new(title: "Test Book", author: "Test Author", price: 19.99, published_date: Date.today)
      expect(book).to be_valid
    end

    it "is invalid without a title" do
      book = Book.new(title: nil, author: "Test Author", price: 19.99, published_date: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end
  end

  # Test for author attribute
  describe "author" do
    it "is valid with an author" do
      book = Book.new(title: "Test Book", author: "Test Author", price: 19.99, published_date: Date.today)
      expect(book).to be_valid
    end

    it "is invalid without an author" do
      book = Book.new(title: "Test Book", author: nil, price: 19.99, published_date: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:author]).to include("can't be blank")
    end
  end

  # Test for price attribute
  describe "price" do
    it "is valid with a price" do
      book = Book.new(title: "Test Book", author: "Test Author", price: 19.99, published_date: Date.today)
      expect(book).to be_valid
    end

    it "is invalid without a price" do
      book = Book.new(title: "Test Book", author: "Test Author", price: nil, published_date: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:price]).to include("can't be blank")
    end
  end

  # Test for published_date attribute
  describe "published_date" do
    it "is valid with a published date" do
      book = Book.new(title: "Test Book", author: "Test Author", price: 19.99, published_date: Date.today)
      expect(book).to be_valid
    end

    it "is invalid without a published date" do
      book = Book.new(title: "Test Book", author: "Test Author", price: 19.99, published_date: nil)
      expect(book).not_to be_valid
      expect(book.errors[:published_date]).to include("can't be blank")
    end
  end
end
