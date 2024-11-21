-- Ensure the extension is available
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop and recreate the schema if it exists
DROP SCHEMA IF EXISTS blog CASCADE;
CREATE SCHEMA blog;

-- Create the users table in the blog schema
DROP TABLE IF EXISTS blog.users CASCADE;

CREATE TABLE blog.users (
    id UUID PRIMARY KEY,
    name VARCHAR(255),
    birthday VARCHAR(255)
);

-- Create the user_posts table with a foreign key reference to users
DROP TABLE IF EXISTS blog.user_posts CASCADE;

CREATE TABLE blog.user_posts (
    id UUID PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    like_count INTEGER NOT NULL DEFAULT 0,
    dislike_count INTEGER NOT NULL DEFAULT 0,
    user_id UUID NOT NULL,
    CONSTRAINT fk_user_posts_user FOREIGN KEY (user_id) REFERENCES blog.users(id) ON DELETE CASCADE
);

-- Create the user_followers table with a foreign key reference to users
DROP TABLE IF EXISTS blog.user_followers CASCADE;

CREATE TABLE blog.user_followers (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthday VARCHAR(255) NOT NULL,
    user_id UUID NOT NULL,
    CONSTRAINT fk_user_followers_user FOREIGN KEY (user_id) REFERENCES blog.users(id) ON DELETE CASCADE
);

-- Create the user_address table with a foreign key reference to users
DROP TABLE IF EXISTS blog.user_address CASCADE;

CREATE TABLE blog.user_address (
    id UUID PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    postal_code VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    user_id UUID UNIQUE NOT NULL,
    CONSTRAINT fk_user_address_user FOREIGN KEY (user_id) REFERENCES blog.users(id) ON DELETE CASCADE
);