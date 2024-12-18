*** Settings ***
Library    OperatingSystem
Library    DatabaseLibrary
Resource   ./resources/db_connection.robot
Resource   ./resources/etl_operations.robot
Resource   ./resources/validation_keywords.robot
Variables  ./variables/global_variables.robot