DROP TABLE IF EXISTS `social_events`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL PRIMARY KEY,
  `fullname` varchar(128) NOT NULL,
  `hashed_password` char(128) NOT NULL
);

CREATE TABLE `social_events` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `user` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `event_type` ENUM('POST', 'WAVE', 'LIKE', 'FROWN') NOT NULL,
  `content` text DEFAULT NULL,
  FOREIGN KEY (`user`) REFERENCES `users`(`username`),
  FOREIGN KEY (`author`) REFERENCES `users`(`username`)
);

-- Hashed passwords are both 'secret'
INSERT INTO `users` (`username`, `fullname`, `hashed_password`) VALUES
    ('Joe', 'Joe Fooble', '$argon2id$v=19$m=65536,t=2,p=1$D/aqIytwOPkz3UfQvrQ0Xg$cMq1vJHbntlXOBrLUZyGTPLDDfsgmCHbb0AcTd1KiDE                               '),
    ('Gareth', 'Gareth Barble', '$argon2id$v=19$m=65536,t=2,p=1$dyiVM0EPn6MN0cerJcdkdQ$AkCOPYN4qNov7PlQt3CeRoKCvrjboHyl6D3/tt7zXXs                               ');

INSERT INTO `social_events` (`author`, `user`, `event_type`, `content`) VALUES
  ('Joe','Gareth','POST','Hey Gareth it\'s Joe'),
  ('Joe','Gareth','POST','What\'s up?'),
  ('Gareth','Joe','POST','Help!'),
  ('Gareth','Joe','WAVE',NULL);
