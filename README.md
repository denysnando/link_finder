# Link scraper and finder

This project has the idea of receiving a URL and finding all possible urls that are present in it:


<div>
  <img src="https://github.com/denysnando/link_finder/assets/3411874/fea6ae14-0fb4-4e2d-8aec-1d64096ae296" alt="Imagem 1" style="width: 500px; height: 300px;">
  <img src="https://github.com/denysnando/link_finder/assets/3411874/892b5c78-fa7d-40d4-b616-9e68c026141b" alt="Imagem 2" style="width: 500px; height: 300px;">
</div>

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Tests](#Tests)
- [Notes](#Notes)

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

To run coverage:
```bash
  coverage=on rspec
```

 

![Captura de Tela 2023-10-19 às 09 20 25](https://github.com/denysnando/link_finder/assets/3411874/ebbe39f7-c319-4f52-8856-e39da6c04e81)

## Notes
   ### Gems used:

   - nokogiri;
   - open-uri;
   - sidekiq;
   - bcrypt;
   - will_paginate;


## How can it be improved?
- Add docker;
- Add cache for preview performance
