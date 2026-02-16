
# Badminton League Manager

A Ruby on Rails application to manage a badminton league. Users can add players, record match results, and view a dynamically calculated leaderboard based on wins and losses.

This project is built following **Rails conventions and best practices**, focusing on clean code, scalability, and maintainability.

---

## Core Features

### Player Management
- Create new players
- View list of all players
- View individual player details
- Delete players (restricted if they have match history)
- Enforces unique player names

### Match Tracking
- Record match results between two players
- Stores winner and loser using self-referential associations
- Prevents invalid matches (same player cannot be winner and loser)
- Maintains full match history

### Leaderboard
- Displays ranking based on total wins
- Shows total wins and losses per player
- Uses optimized database queries for performance
- Deterministic ranking order

### Seed Data
- Pre-populated realistic players and matches
- Allows quick evaluation of leaderboard functionality

### Automated Testing
- RSpec test suite included
- FactoryBot used for test data generation
- Tests for:
  - Models
  - Service objects
  - Query objects

---

## Technology Stack

- Ruby 4.0.0
- Rails 8.1.2
- PostgreSQL
- RSpec
- FactoryBot

---

## Architecture Overview

This project follows clean architecture principles:

Controller → Service → Model → Database
↓
Query Object
↓
View

---

## Setup Instructions

### Prerequisites

- Ruby 4.0.0
- Rails 8.1.2
- PostgreSQL

---

### Installation

Clone repository:

```bash
git clone https://github.com/iViral-Parekh/badminton-league.git
cd badminton_league

Install dependencies:
bundle install

Create database:
rails db:create

Run migrations:
rails db:migrate

Seed database:
rails db:seed

Start server:
rails server

Visit:
http://localhost:3000

Seeding Data

Seed file creates:
10 professional players
25 realistic matches
Fully populated leaderboard

Run: 
rails db:seed

Reset database completely:
rails db:reset

Running Tests
bundle exec rspec


Test coverage includes:

Player model
Match model
MatchRecorder service
LeaderboardQuery
Performance Considerations