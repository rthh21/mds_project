# Rails Live Event Application

A Ruby on Rails application for hosting and managing live events with real-time video streaming, event scheduling, and user authentication.

## Features

- User registration and authentication (Devise)
- Organizer and attendee roles
- Create, edit, and delete events
- Live video streaming (HLS support)
- Dashboard for event management
- Responsive design

---

## Getting Started

Follow these steps to set up and run the application.

### 1. Prerequisites

- **Ruby** (version 3.1+ recommended)
- **Rails** (version 7+ recommended)
- **PostgreSQL** (or your preferred database)

### 2. Clone the Repository

- git clone https://github.com/your-username/your-repo-name.git
- cd your-repo-name

### 3. Set Up the Database

Create and migrate the database:

- rails db:create
- rails db:migrate

### 4. Bundle and run!

- bundle install
- rails s