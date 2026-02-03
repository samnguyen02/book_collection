# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data to avoid duplicates when re-seeding
Book.destroy_all
Author.destroy_all
User.destroy_all
UserBook.destroy_all

# Create Authors
authors = Author.create!([
  { name: "J.K. Rowling" },
  { name: "George Orwell" },
  { name: "Harper Lee" },
  { name: "F. Scott Fitzgerald" },
  { name: "Jane Austen" }
])

# Create Books (at least 5 entries as required)
books = Book.create!([
  { title: "Harry Potter and the Sorcerer's Stone", price: 19.99, published_date: Date.new(1997, 6, 26), author: authors[0] },
  { title: "1984", price: 14.99, published_date: Date.new(1949, 6, 8), author: authors[1] },
  { title: "To Kill a Mockingbird", price: 12.99, published_date: Date.new(1960, 7, 11), author: authors[2] },
  { title: "The Great Gatsby", price: 11.99, published_date: Date.new(1925, 4, 10), author: authors[3] },
  { title: "Pride and Prejudice", price: 9.99, published_date: Date.new(1813, 1, 28), author: authors[4] },
  { title: "Animal Farm", price: 10.99, published_date: Date.new(1945, 8, 17), author: authors[1] },
  { title: "Harry Potter and the Chamber of Secrets", price: 19.99, published_date: Date.new(1998, 7, 2), author: authors[0] }
])

# Create Users
users = User.create!([
  { username: "bookworm123" },
  { username: "reader_jane" },
  { username: "library_lover" }
])

# Create UserBooks relationships
UserBook.create!([
  { user: users[0], book: books[0] },
  { user: users[0], book: books[1] },
  { user: users[1], book: books[2] },
  { user: users[1], book: books[3] },
  { user: users[2], book: books[4] }
])

puts "Seed data created successfully!"
puts "Created #{Author.count} authors"
puts "Created #{Book.count} books"
puts "Created #{User.count} users"
puts "Created #{UserBook.count} user-book relationships"
