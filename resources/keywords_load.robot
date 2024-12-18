*** Settings ***
Library     DatabaseLibrary
Resource    ../variables/global_variables.robot

*** Keywords ***

Connect DB
    Connect To Database  pymysql  ${DBName}  ${DBUser}  ${DBPassword}  ${DBHost}  ${DBPort}