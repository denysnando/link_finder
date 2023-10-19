# link scraper and finder

This project demonstrates a text-based command system to generate a history quake_log implemented in Ruby. It includes two classes, `Base` and `Main`, within the `Repl` module, which allow users to select and execute commands from a menu of options.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Tests](#Tests)

## Requirements

Before running the project, make sure you have the following:

- Ruby installed (version 3.1.2).
- Rails installed (version 7.1.1).
- Postgresql installed (version 1.3.4).

## Installation

1. Clone this repository to your local machine:

   ```bash
     git clone https://github.com/denysnando/link_finder
   ```
2. Setup
   ```bash
     cd link_finder/
     bundle
     bundle exec rake db:create
     bundle exec rake db:migrate
   ```

## Usage
  ```bash
    bundle exec rails s
  ```

## Tests
  ```bash
    rspec
  ```

To run coverate:
```bash
    coverage=on rspec
  ```

## How can it be improved?
- Add docker;
