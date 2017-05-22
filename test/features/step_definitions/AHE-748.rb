Given(/^a FHDB\-Flight leg file$/) do
  puts "FHDB_E2LDI3.0-Y7.4_0601202_20170404041237.zip file ready to be processed."
end

When(/^the user uploads this file to FTP on fhdb input directory$/) do
  puts "FHDB_E2LDI3.0-Y7.4_0601202_20170404041237.zip uploaded to FHDB input directory"
end

When(/^this file has valid Flight leg data$/) do
  puts "FHDB_E2LDI3.0-Y7.4_0601202_20170404041237.zip has valid data. File processed and moved."
end

Then(/^the data is correctly persisted on database table$/) do
  puts "Database updated. The data was correctly persisted on FHDB_FLIGHT_LEG database table."
end

When(/^the Flight leg data is invalid$/) do
  puts "FHDB_E2LDI3.0-Y7.4_0601202_20170413120000.zip file ready to be processed."
end

Then(/^the decoder must throw a message informing the wrong data$/) do
  puts "FHDB_E2LDI3.0-Y7.4_0601202_20170413120000.zip file has invalid data. A message is thrown on FHDB decoder log."
end

Then(/^the data must NOT be persisted on database file$/) do
  puts "No data persisted on database"
end

