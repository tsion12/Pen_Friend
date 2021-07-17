CREATE TABLE app_user(
    id bigint GENERATED ALWAYS AS IDENTITY
             PRIMARY KEY,
    pen_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    number_of_mentors int DEFAULT 0,
    number_of_mentees int DEFAULT 0,
    group_id bigint references group_chat (group_id) ON UPDATE CASCADE ON DELETE SET NULL,
    profile_id bigint references user_profile (profile_id),
    createdAt Date,
    updatedAt Date
);

CREATE TABLE user_profile(
    profile_id bigint GENERATED ALWAYS AS IDENTITY
             PRIMARY KEY,
    gender TEXT,
    profession TEXT,
    birthday Date,
    bio TEXT,
    fav_books TEXT,
    fav_places TEXT,
    fav_movies TEXT,
    hobby TEXT,
    future_plan TEXT
);
CREATE TABLE group_chat(
    group_id bigint GENERATED ALWAYS AS IDENTITY
             PRIMARY KEY,
    group_name TEXT,
    creator_id TEXT,
    creation_date TIMESTAMP
);



CREATE TABLE freindship(
    mentor_id  bigint references app_user (user_id) ON UPDATE CASCADE ON DELETE SET NULL,
    mentee_id  bigint references app_user (user_id) ON UPDATE CASCADE ON DELETE SET NULL,
    date_of_freindship TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (mentor_id, mentee_id)
);

CREATE TABLE request(
    request_id bigint GENERATED ALWAYS AS IDENTITY
             PRIMARY KEY,
    sender_id bigint references app_user (user_id) ON UPDATE CASCADE ON DELETE SET NULL,
    receiver_id bigint references app_user (user_id) ON UPDATE CASCADE ON DELETE SET NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    accepted boolean DEFAULT false
);


CREATE TABLE notification(
    notifitcations_id bigint GENERATED ALWAYS AS IDENTITY
             PRIMARY KEY,
    notifications_type bigint,
    description TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    receiver_id bigint references app_user (user_id) ON UPDATE CASCADE ON DELETE SET NULL
);



