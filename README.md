# Meteorite Landings Data Cleaning with SQLite

## Project Overview

This project demonstrates how to import, clean, and organize a real-world dataset of meteorite landings using SQLite. The dataset consists of historical meteorite landing records, which were cleaned and structured into a normalized SQLite database for further analysis.

## Dataset

- **Source:** `meteorites.csv` (historical meteorite landings)
- The original CSV contains raw data with missing values, inconsistent formatting, and irrelevant entries.

## Goals

- Import meteorite data into a temporary SQLite table.
- Clean the dataset by:
  - Converting empty or invalid values to `NULL`.
  - Rounding decimal values (mass, latitude, longitude) to two decimal places.
  - Filtering out meteorites labeled as “Relict” in the `nametype` column.
  - Ensuring only meteorites with discovery status "Fell" or "Found" are included.
- Create a final `meteorites` table with appropriate columns and constraints.
- Assign new IDs ordered by discovery year and name (oldest first, alphabetical).
- Prepare clean data for use in further analyses or applications.

## Technologies Used

- SQLite 3
- SQL (Data import, cleaning, filtering, table creation, constraints)

## How to Run

1. Ensure you have `sqlite3` installed on your machine.
2. Place `meteorites.csv` and `import.sql` in the same folder.
3. Run the following command in your terminal to create and populate the database:

   ```bash
   cat import.sql | sqlite3 meteorites.db
