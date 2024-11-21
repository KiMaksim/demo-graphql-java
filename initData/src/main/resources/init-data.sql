-- Enable uuid-ossp extension for UUID generation if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Insert 10 Users with manually generated UUIDs
INSERT INTO blog.users (id, name, birthday) VALUES
('f6f4bc30-b4e1-4c3c-9aeb-3d94b8aaf05d', 'Alice Johnson', '1990-01-15'),
('2d8c0410-0b27-4333-b27c-22d23d65d5c2', 'Bob Smith', '1985-07-23'),
('07b3a150-d777-42d9-b82f-c61de6d71f1b', 'Catherine Lee', '1992-12-05'),
('0a6f0f61-b6d1-4f0d-8246-39595fc73c70', 'David Brown', '1988-03-18'),
('5f4e98d0-4e62-4bdb-bda7-bec78b8d4749', 'Emma White', '1995-10-10'),
('ce590ea2-c040-4b4e-8db6-eed875f4cf22', 'Frank Green', '1983-06-30'),
('010fc540-9cd7-4844-ae30-9f83566a5855', 'Grace Black', '1991-04-25'),
('e9ab5be0-4fe7-4f13-9ed5-800b43fe82b2', 'Harry Wilson', '1989-09-15'),
('7f5940b1-9680-4be1-8d3a-7d82a4b2bc13', 'Ivy Adams', '1994-11-11'),
('1a52428d-372b-4fd5-89bb-c9837b17efc5', 'Jack Lewis', '1987-05-05');

-- Insert Addresses for each User with manually generated UUIDs
INSERT INTO blog.user_address (id, street, postal_code, city, user_id) VALUES
('f6f4bc30-b4e1-4c3c-9aeb-3d94b8aaf05d', '123 Maple St', '10001', 'New York', 'f6f4bc30-b4e1-4c3c-9aeb-3d94b8aaf05d'),
('2d8c0410-0b27-4333-b27c-22d23d65d5c2', '456 Oak Ave', '10002', 'Los Angeles', '2d8c0410-0b27-4333-b27c-22d23d65d5c2'),
('07b3a150-d777-42d9-b82f-c61de6d71f1b', '789 Pine Rd', '10003', 'Chicago', '07b3a150-d777-42d9-b82f-c61de6d71f1b'),
('0a6f0f61-b6d1-4f0d-8246-39595fc73c70', '101 Birch Blvd', '10004', 'Houston', '0a6f0f61-b6d1-4f0d-8246-39595fc73c70'),
('5f4e98d0-4e62-4bdb-bda7-bec78b8d4749', '202 Cedar St', '10005', 'Phoenix', '5f4e98d0-4e62-4bdb-bda7-bec78b8d4749'),
('ce590ea2-c040-4b4e-8db6-eed875f4cf22', '303 Elm Ave', '10006', 'Philadelphia', 'ce590ea2-c040-4b4e-8db6-eed875f4cf22'),
('010fc540-9cd7-4844-ae30-9f83566a5855', '404 Spruce Rd', '10007', 'San Antonio', '010fc540-9cd7-4844-ae30-9f83566a5855'),
('e9ab5be0-4fe7-4f13-9ed5-800b43fe82b2', '505 Fir Ln', '10008', 'San Diego', 'e9ab5be0-4fe7-4f13-9ed5-800b43fe82b2'),
('7f5940b1-9680-4be1-8d3a-7d82a4b2bc13', '606 Willow Blvd', '10009', 'Dallas', '7f5940b1-9680-4be1-8d3a-7d82a4b2bc13'),
('1a52428d-372b-4fd5-89bb-c9837b17efc5', '707 Aspen Ave', '10010', 'San Jose', '1a52428d-372b-4fd5-89bb-c9837b17efc5');

-- Insert Posts (0-5 per user) with manually generated UUIDs
INSERT INTO blog.user_posts (id, title, content, like_count, dislike_count, user_id) VALUES
('e0cf44b8-e0b3-4e80-b3f9-6366a097a574', 'Post Title 1', 'Content of the first post', 10, 2, 'f6f4bc30-b4e1-4c3c-9aeb-3d94b8aaf05d'),
('2dfb504b-b606-45b5-b18f-fc2e739b7c1e', 'Post Title 2', 'Content of the second post', 15, 3, 'f6f4bc30-b4e1-4c3c-9aeb-3d94b8aaf05d'),
('37f0b410-5429-4552-bc5c-170f6740de62', 'Post Title 3', 'Content of the third post', 8, 1, '2d8c0410-0b27-4333-b27c-22d23d65d5c2'),
('e4e4de65-78f7-4d6d-bae0-280a89b39f40', 'Post Title 4', 'Content of the fourth post', 22, 5, '07b3a150-d777-42d9-b82f-c61de6d71f1b'),
('c931e4ad-72cc-44bc-a9fd-bb62d4373ab1', 'Post Title 5', 'Content of the fifth post', 0, 0, '0a6f0f61-b6d1-4f0d-8246-39595fc73c70'),
('672d9a6d-1eb1-4cd2-a212-8859b395b92d', 'Post Title 6', 'Content of the sixth post', 5, 0, '5f4e98d0-4e62-4bdb-bda7-bec78b8d4749'),
('c1b5d1f4-38d7-45c1-8c77-cb140ae72233', 'Post Title 7', 'Content of the seventh post', 30, 4, 'ce590ea2-c040-4b4e-8db6-eed875f4cf22'),
('efca3856-b343-4f30-883a-27b96b7f1918', 'Post Title 8', 'Content of the eighth post', 12, 1, 'e9ab5be0-4fe7-4f13-9ed5-800b43fe82b2'),
('10c29d87-678e-460a-a227-26da6b1a57d6', 'Post Title 9', 'Content of the ninth post', 8, 0, '7f5940b1-9680-4be1-8d3a-7d82a4b2bc13'),
('33ac8a42-0f02-4215-8a09-277402b60f56', 'Post Title 10', 'Content of the tenth post', 2, 1, '1a52428d-372b-4fd5-89bb-c9837b17efc5');

-- Insert Followers (some users follow others) with manually generated UUIDs
INSERT INTO blog.user_followers (id, name, birthday, user_id) VALUES
('a9be1e16-83e1-4328-9d2f-09ffb08ff32f', 'Follower 1', '1993-02-14', 'f6f4bc30-b4e1-4c3c-9aeb-3d94b8aaf05d'),
('ed779bc6-d73f-4cc7-832b-38cf7ff28cbb', 'Follower 2', '1990-09-18', '2d8c0410-0b27-4333-b27c-22d23d65d5c2'),
('0d986d89-7c36-4d6b-ae28-1df5e986a29d', 'Follower 3', '1985-12-22', '07b3a150-d777-42d9-b82f-c61de6d71f1b'),
('92fc1fbc-0790-4664-9ae3-1dbf93e61ee5', 'Follower 4', '1989-08-11', '0a6f0f61-b6d1-4f0d-8246-39595fc73c70'),
('163ca8f0-dc59-42e7-9532-83f8e6e567a9', 'Follower 5', '1992-04-15', '5f4e98d0-4e62-4bdb-bda7-bec78b8d4749'),
('648c1101-535f-4e4d-a8a4-9a7a2d7ec71b', 'Follower 6', '1988-11-19', 'ce590ea2-c040-4b4e-8db6-eed875f4cf22'),
('348b8f96-d423-43c2-93ba-6766b984f1c7', 'Follower 7', '1991-06-23', '010fc540-9cd7-4844-ae30-9f83566a5855'),
('466a25c8-1fae-40a2-b7fc-0a0790242319', 'Follower 8', '1986-07-30', 'e9ab5be0-4fe7-4f13-9ed5-800b43fe82b2'),
('f7c736b1-e2fc-4f71-953d-c01a89f79b73', 'Follower 9', '1993-10-17', '7f5940b1-9680-4be1-8d3a-7d82a4b2bc13'),
('5e609fd8-5506-453b-b870-c0cbeeb39e7c', 'Follower 10', '1988-05-27', '1a52428d-372b-4fd5-89bb-c9837b17efc5');