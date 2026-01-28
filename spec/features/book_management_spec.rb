require "rails_helper"

RSpec.describe "Book Management", type: :feature do
  # Sunny day scenario - successful book creation
  describe "Creating a book successfully" do
    it "displays success flash notice when book is created with valid data" do
      visit new_book_path

      fill_in "Title", with: "The Great Gatsby"
      fill_in "Author", with: "F. Scott Fitzgerald"
      fill_in "Price", with: "19.99"
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Book was successfully created")
    end
  end

  # Rainy day scenario - blank title
  describe "Creating a book with blank title" do
    it "displays error message when title is blank" do
      visit new_book_path

      fill_in "Title", with: ""
      fill_in "Author", with: "Test Author"
      fill_in "Price", with: "19.99"
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Title can't be blank")
    end
  end

  # Integration test for author attribute
  describe "Creating a book with author" do
    it "displays success when book is created with author" do
      visit new_book_path

      fill_in "Title", with: "Test Book"
      fill_in "Author", with: "Test Author"
      fill_in "Price", with: "19.99"
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Book was successfully created")
    end
  end

  # Rainy day - blank author
  describe "Creating a book with blank author" do
    it "displays error message when author is blank" do
      visit new_book_path

      fill_in "Title", with: "Test Book"
      fill_in "Author", with: ""
      fill_in "Price", with: "19.99"
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Author can't be blank")
    end
  end

  # Integration test for price attribute
  describe "Creating a book with price" do
    it "displays success when book is created with price" do
      visit new_book_path

      fill_in "Title", with: "Test Book"
      fill_in "Author", with: "Test Author"
      fill_in "Price", with: "19.99"
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Book was successfully created")
    end
  end

  # Rainy day - blank price
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

  # Integration test for published_date attribute
  describe "Creating a book with published date" do
    it "displays success when book is created with published date" do
      visit new_book_path

      fill_in "Title", with: "Test Book"
      fill_in "Author", with: "Test Author"
      fill_in "Price", with: "19.99"
      select "2024", from: "book_published_date_1i"
      select "January", from: "book_published_date_2i"
      select "15", from: "book_published_date_3i"

      click_on "Create Book"

      expect(page).to have_content("Book was successfully created")
    end
  end

  # Rainy day - no published date selected
  describe "Creating a book without published date" do
    it "displays error message when published date is missing" do
      visit new_book_path

      fill_in "Title", with: "Test Book"
      fill_in "Author", with: "Test Author"
      fill_in "Price", with: "19.99"
      select "", from: "book_published_date_1i"

      click_on "Create Book"

      expect(page).to have_content("Published date can't be blank")
    end
  end
end
