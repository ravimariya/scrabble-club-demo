# Scrabble Club Demo

A scrabble club requires a system to store members’ information and provide leader
boards to show their top performing players

Feature | Description
------------ | -------------
Leader Board | Display members with atleast 10 games, display average score from top 10 games
Members | Add/update Members, display total win/loss, avg. score 
Games | create game, select 2 participants and add their scores

* Ruby version

  3.0.1

* Rails version

  6.1.4

# Getting Started

1. Clone the repository in local machine https://github.com/ravimariya/scrabble-club-demo.git

2. go into local project folder and run 
    > bundle install

3. update `database.yml.example` to `database.yml` file with your db config

4. run `rails db:setup`

5. run `rails s` to run rails server
