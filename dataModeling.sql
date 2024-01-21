-- ## **Part 1: Schema Design**

-- ### **Part One: Medical Center**

-- Design the schema for a medical center.

-- - A medical center employs several doctors
-- - A doctors can see many patients
-- - A patient can be seen by many doctors
-- - During a visit, a patient may be diagnosed to have one or more diseases.

-- ###

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE medical_center (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  medical_center_id INTEGER REFERENCES medical_center
);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birth_date DATE NOT NULL,
  doctor_id INTEGER REFERENCES doctors
  medical_center_id INTEGER REFERENCES medical_center
);

CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  patient_id INTEGER REFERENCES patients
);

-- ### **Part Two: Craigslist**

-- Design a schema for Craigslist! Your schema should keep track of the following

-- - The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- - Users and preferred region
-- - Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- - Categories that each post belongs to

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE users (
  id SERIAL,
  username TEXT NOT NULL PRIMARY KEY,
  preferred_region_id INTEGER REFERENCES region
);

CREATE TABLE posts (
  id SERIAL,
  title TEXT NOT NULL,
  text_of_body TEXT,
  user INTEGER,
  location_of_post TEXT,
  region_of_post INTEGER REFERENCES studios ON DELETE CASCADE,
  category_id INTEGER REFERENCES categories
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  post_id INTEGER REFERENCES posts ON DELETE CASCADE
);

-- ### **Part Three: Soccer League**

-- Design a schema for a simple sports league. Your schema should keep track of

-- - All of the teams in the league-- - All of the goals scored by every player for each game
-- - All of the players in the league and their corresponding teams
-- - All of the referees who have been part of each game
-- - All of the matches played between teams
-- - All of the start and end dates for season that a league has
-- - The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

