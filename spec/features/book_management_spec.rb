require "rails_helper"

RSpec.describe "Book Management", type: :feature do
  # Sunny day scenario - successful book creation
  describe "Creating a book successfully" do
    it "displays success flash notice when book is created with valid data" do
      visit new_book_path

      fill_in "Title", with: "The Great Gatsby"
      fill_in "Author", with: "F. Scott Fitzgerald"
      fill_in "Price", with: "15.99"
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Book was successfully created")
      expect(Book.last.title).to eq("The Great Gatsby")
      expect(Book.last.author).to eq("F. Scott Fitzgerald")
      expect(Book.last.price).to eq(15.99)
    end
  end

  # Rainy day scenario - blank title
  describe "Creating a book with blank title" do
    it "displays error message when title is blank" do
      visit new_book_path

      fill_in "Title", with: ""
      fill_in "Author", with: "Test Author"
      fill_in "Price", with: "10.99"
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Title can't be blank")
    end
  end

  # Rainy day scenario - blank author
  describe "Creating a book with blank author" do
    it "displays error message when author is blank" do
      visit new_book_path

      fill_in "Title", with: "Test Book"
      fill_in "Author", with: ""
      fill_in "Price", with: "10.99"
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Author can't be blank")
    end
  end

  # Rainy day scenario - blank price
  describe "Creating a book with blank price" do
    it "displays error message when price is blank" do
      visit new_book_path

      fill_in "Title", with: "Test Book"
      fill_in "Author", with: "Test Author"
      fill_in "Price", with: ""
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Price can't be blank")
    end
  end

  # Test updating a book
  describe "Updating a book" do
    let!(:book) { Book.create!(title: "Old Title", author: "Old Author", price: 9.99, published_date: Date.new(2023, 6, 1)) }

    it "displays success flash notice when book is updated" do
      visit edit_book_path(book)

      fill_in "Title", with: "New Title"
      fill_in "Author", with: "New Author"
      fill_in "Price", with: "19.99"

      click_on "Update Book"

      expect(page).to have_content("Book was successfully updated.")
      expect(book.reload.title).to eq("New Title")
      expect(book.reload.author).to eq("New Author")
    end
  end

  # Test deleting a book
  describe "Deleting a book" do
    let!(:book) { Book.create!(title: "Book to Delete", author: "Author", price: 9.99, published_date: Date.new(2023, 6, 1)) }

    it "displays success flash notice when book is deleted" do
      visit delete_book_path(book)

      click_on "Yes, Delete This Book"

      expect(page).to have_content("Book was successfully destroyed.")
      expect(Book.exists?(book.id)).to be false
    end
  end

  # Test viewing book index
  describe "Viewing books index" do
    let!(:book) { Book.create!(title: "Test Book", author: "Test Author", price: 9.99, published_date: Date.new(2023, 6, 1)) }

    it "displays the list of books" do
      visit books_path

      expect(page).to have_content("Test Book")
      expect(page).to have_content("Test Author")
    end
  end

  # Test viewing a single book
  describe "Viewing a single book" do
    let!(:book) { Book.create!(title: "Single Book", author: "Single Author", price: 12.99, published_date: Date.new(2023, 6, 1)) }

    it "displays the book details" do
      visit book_path(book)

      expect(page).to have_content("Single Book")
      expect(page).to have_content("Single Author")
      expect(page).to have_content("12.99")
    end
  end
end
