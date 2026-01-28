# Book Collection App

A simple CRUD (Create, Read, Update, Delete) application built with Ruby on Rails for managing a book collection.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [Application Structure](#application-structure)
- [Routes](#routes)
- [Pages](#pages)
- [Usage Guide](#usage-guide)
- [Screenshots Guide](#screenshots-guide)

## Overview

This Book Collection application allows users to manage a collection of books. Users can add new books, view book details, update existing books, and delete books from the collection. The application follows the MVC (Model-View-Controller) architectural pattern and uses RESTful/resourceful routes.

## Features

- **Create**: Add new books to the collection
- **Read**: View all books and individual book details
- **Update**: Edit existing book information
- **Delete**: Remove books with a confirmation page
- **Flash Notices**: Feedback messages after create, update, and delete operations
- **Resourceful Routes**: RESTful routing conventions

## Technology Stack

- **Framework**: Ruby on Rails 8.0
- **Database**: PostgreSQL
- **Ruby Version**: 3.4.6
- **Frontend**: ERB templates with Turbo/Hotwire

## Prerequisites

- Docker (recommended) OR
- Ruby 3.4.6
- PostgreSQL
- Bundler

## Installation

### Using Docker (Recommended)

1. Pull the Docker image:
   ```bash
   docker pull paulinewade/csce431:sp26v1
   ```

2. Clone the repository and navigate to the project directory:
   ```bash
   cd test_app
   ```

3. Start the Docker container with the project mounted.

### Local Installation

1. Clone the repository:
   ```bash
   git clone <your-repository-url>
   cd test_app
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   ```

## Running the Application

### In Docker

```bash
rails server -b 0.0.0.0
```

### Locally

```bash
rails server
```

Then open your browser and navigate to: `http://127.0.0.1:3000`

## Application Structure

```
test_app/
├── app/
│   ├── controllers/
│   │   └── books_controller.rb    # Handles CRUD operations
│   ├── models/
│   │   └── book.rb                # Book model
│   └── views/
│       └── books/
│           ├── index.html.erb     # Home Page - List all books
│           ├── new.html.erb       # Add a Book Page
│           ├── edit.html.erb      # Update a Book Page
│           ├── show.html.erb      # Show Details Page
│           ├── delete.html.erb    # Delete Confirmation Page
│           ├── _form.html.erb     # Shared form partial
│           └── _book.html.erb     # Book partial
├── config/
│   └── routes.rb                  # Route definitions
└── db/
    └── migrate/
        └── *_create_books.rb      # Database migration
```

## Routes

The application uses resourceful routes. Here are all available routes:

| HTTP Method | Path | Controller#Action | Description |
|-------------|------|-------------------|-------------|
| GET | `/` | books#index | Home Page (root) |
| GET | `/books` | books#index | List all books |
| GET | `/books/new` | books#new | Add a Book form |
| POST | `/books` | books#create | Create a new book |
| GET | `/books/:id` | books#show | Show book details |
| GET | `/books/:id/edit` | books#edit | Edit book form |
| PATCH/PUT | `/books/:id` | books#update | Update a book |
| GET | `/books/:id/delete` | books#delete | Delete confirmation |
| DELETE | `/books/:id` | books#destroy | Delete a book |

## Pages

### 1. Home Page (`/` or `/books`)
- Displays all books in a table format
- Shows flash notices after operations
- Contains links to:
  - Show (view book details)
  - Edit (update book)
  - Delete (delete confirmation)
  - Add New Book

### 2. Add a Book Page (`/books/new`)
- Form to create a new book
- Fields: Title
- Link back to Home Page

### 3. Update a Book Page (`/books/:id/edit`)
- Pre-populated form with current book details
- Fields: Title
- Links to Show This Book and Back to Home Page

### 4. Show Details Page (`/books/:id`)
- Displays book details (Title)
- Links to Edit, Delete, and Back to Home Page

### 5. Delete a Book Page (`/books/:id/delete`)
- Confirmation message before deletion
- "Yes, Delete This Book" button
- "No, Back to Home Page" link

## Usage Guide

### Adding a Book
1. From the Home Page, click "Add New Book"
2. Enter the book title
3. Click "Create Book"
4. You'll be redirected to the Home Page with a success message

### Viewing a Book
1. From the Home Page, click "Show" next to a book
2. View the book details
3. Click "Back to Home Page" to return

### Editing a Book
1. From the Home Page, click "Edit" next to a book
2. Modify the title in the form
3. Click "Update Book"
4. You'll be redirected to the Home Page with a success message

### Deleting a Book
1. From the Home Page, click "Delete" next to a book
2. Review the confirmation page
3. Click "Yes, Delete This Book" to confirm
4. You'll be redirected to the Home Page with a success message

## Screenshots Guide

For the assignment report, take screenshots of:

1. **Screenshot 1**: Home Page with at least one book showing all CRUD links
2. **Screenshot 2**: Add a Book Page (new book form)
3. **Screenshot 3**: Update a Book Page (edit form with pre-populated data)
4. **Screenshot 4**: Show Details Page (book details view)
5. **Screenshot 5**: Delete a Book Page (confirmation page)
6. **Screenshot 6**: Home Page with flash notice after an operation
7. **Screenshot 7**: Running website at http://127.0.0.1:3000

## Book Model

Current attributes:
- `title` (String) - The title of the book

*Note: Additional attributes (author, price, published_date) will be added in Book Collection 2.*

## Database Commands

```bash
# Create the database
rails db:create

# Run migrations
rails db:migrate

# Reset the database (drop, create, migrate)
rails db:reset

# Check migration status
rails db:migrate:status
```

## Git Workflow

```bash
# Create and switch to test branch
git checkout -b test

# Add all files
git add .

# Commit changes
git commit -m "Your commit message"

# Push to remote
git push origin test
```

## License

This project is for educational purposes as part of CSCE 431.
