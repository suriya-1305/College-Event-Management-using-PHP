SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `booking_details` (
  `BookingID` int(10) NOT NULL,
  `BookingTimeStamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `UserID` varchar(10) NOT NULL,
  `EventID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `event_details` (
  `EventID` int(10) NOT NULL,
  `EventName` varchar(100) NOT NULL,
  `EventDate` date NOT NULL,
  `EventTime` time NOT NULL,
  `EventCategory` varchar(100) NOT NULL,
  `EventDescription` text NOT NULL,
  `EventTicketPrice` double NOT NULL,
  `EventTicketTotal` int(11) NOT NULL,
  `EventTicketSold` int(11) NOT NULL,
  `VenueID` int(10) NOT NULL,
  `UserID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_details` (
  `UserNo` int(10) NOT NULL,
  `UserID` varchar(10) NOT NULL,
  `UserFullName` varchar(80) NOT NULL,
  `UserPassword` varchar(12) NOT NULL,
  `UserType` varchar(11) NOT NULL,
  `UserEmail` varchar(50) NOT NULL,
  `UserImage` longblob NOT NULL,
  `UserImageName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `venue_details` (
  `VenueID` int(11) NOT NULL,
  `VenueName` varchar(80) NOT NULL,
  `VenueInfo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `booking_details_ibfk_1` (`UserID`),
  ADD KEY `booking_details_ibfk_2` (`EventID`);

ALTER TABLE `event_details`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `event_details_ibfk_1` (`VenueID`),
  ADD KEY `event_details_ibfk_3` (`UserID`);

ALTER TABLE `user_details`
  ADD PRIMARY KEY (`UserNo`),
  ADD UNIQUE KEY `UserID` (`UserID`);

ALTER TABLE `venue_details`
  ADD PRIMARY KEY (`VenueID`);

ALTER TABLE `booking_details`
  MODIFY `BookingID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `event_details`
  MODIFY `EventID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `user_details`
  MODIFY `UserNo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `venue_details`
  MODIFY `VenueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user_details` (`UserID`),
  ADD CONSTRAINT `booking_details_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `event_details` (`EventID`);

ALTER TABLE `event_details`
  ADD CONSTRAINT `event_details_ibfk_1` FOREIGN KEY (`VenueID`) REFERENCES `venue_details` (`VenueID`),
  ADD CONSTRAINT `event_details_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `user_details` (`UserID`);
COMMIT;

