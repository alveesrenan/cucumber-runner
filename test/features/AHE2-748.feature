Feature: FHDB-Flight Legs file decoder
Here we will test the Flight Leg file decoder and the 
data persistance on database.
@Positive
Scenario: Flight leg data persistance
 Given a FHDB-Flight leg file
 When the user uploads this file to FTP on fhdb input directory
 And this file has valid Flight leg data 
 Then the data is correctly persisted on database table
@Negative
Scenario: Error message on FHDB decoder log
 Given a FHDB-Flight leg file
 When the user uploads this file to FTP on fhdb input directory
 And the Flight leg data is invalid
 Then the decoder must throw a message informing the wrong data
 And the data must NOT be persisted on database file

