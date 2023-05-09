-- Active: 1683590914366@@127.0.0.1@3306

CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        role TEXT NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL
    );

CREATE TABLE
    posts (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        creator_id TEXT NOT NULL REFERENCES users(id),
        content TEXT NOT NULL,
        likes INTEGER NOT NULL,
        dislikes INTEGER NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL,
        updated_at TEXT NOT NULL
    );

CREATE TABLE
    likes_dislikes (
        user_id TEXT NOT NULL REFERENCES users(id),
        post_id TEXT NOT NULL REFERENCES posts(id),
        like INTEGER NOT NULL
    );


DROP TABLE users;

DROP TABLE posts;

DROP TABLE likes_dislikes;