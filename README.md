# Chat App

This is a real-time chat application built with **Ruby on Rails**, **Hotwire**, and **Tailwind CSS**. Users can sign up, log in, jpin and leave chat rooms and exchange messages in real time. The app supports multiple users in the same chat room, and all interactions are stored persistently in a database.

## Features

- 🔐 User authentication (sign up, login, logout)
- 💬 Real-time messaging with Hotwire (Turbo Streams & Turbo Frames)
- 🏠 Multiple chat rooms
- ➕ Join and leave rooms dynamically
- 💾 Messages and user data stored in PostgreSQL
- 📦 Dockerized setup for consistent development and deployment
- ☁️ Deployment-ready with [Kamal]

## Tech Stack

- **Ruby on Rails 8**
- **Hotwire** (Turbo, Stimulus)
- **Phlex** for view rendering
- **Tailwind CSS** for styling
- **PostgreSQL** as the database
- **Docker** for containerization
- **Kamal** for deployment

### Local Setup

```bash
# Clone the repository
git clone https://github.com/JulietaCCollado/chat_app.git
cd chat_app

# Install dependencies
bundle install
yarn install

# Setup database
rails db:setup

# Run the server
bin/dev


Made by Julieta
```
