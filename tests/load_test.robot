*** Settings ***
Documentation  Database Testing in Robot Framework
Library  DatabaseLibrary
Resource        ../resources/keywords_load.robot

*** Test Cases ***
Verify Successful creation of Table
    Connect DB
    ${output}=  Execute SQL String  CREATE TABLE Persons (PersonID int, FirstName varchar(255), Address varchar(255), City varchar(255));
    Should Be Equal As Strings  ${output}  None

Verify Data Insertion in Table
    ${output}=  Execute SQL Script  ./Resources/db.sql
    Should Be Equal As Strings  ${output}  None

Verify Data Update in Table
    ${output}=  Execute SQL String  UPDATE Persons SET FirstName = "Kevin" WHERE City="Baker street";
    Should Be Equal As Strings  ${output}  None

Verify a certain record is present or Not
    Check If Exists In Database  SELECT PersonID FROM Persons WHERE FirstName="user"

Verify a Table is present or Not
    Table Must Exist  Persons

Verify that the row count is 1
    Row Count Is Equal To X  SELECT PersonID FROM Persons WHERE CITY="Baker street"  1

Verify that you can Delete a Table
    ${output}=  Execute SQL String  DROP TABLE Persons;
    Should Be Equal As Strings  ${output}  None

Disconnect DB
    Disconnect From Database