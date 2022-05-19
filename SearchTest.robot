*** Settings ***
Documentation  Testing vyhledávání na Mall.

Library  SeleniumLibrary  
Resource  Resources/main_page.robot
Resource  Resources/result_page.robot

Test Setup  ${URL}  browser=${Browser}
Test Teardown  Close All Browsers

*** Variables ***
${Browser}=  chrome
${URL}=  https://www.mall.cz/
${input_search_xpath}=  //input[@id="site-search-input"]
${button_search_xpath}=  //button[@id="search-button"]
${header_text_xpath}=  //h1//span[@data-sel="page-title"] 

*** Keywords ***
Vyhledej slovo
    [Arguments]  ${slovo}
    Sleep  2s
    Wait Until Element Is Visible  ${input_search_xpath}
    Input text  ${input_search_xpath}  ${slovo}
    Click Element  ${button_search_xpath}

Zkontroluj vysledek
    [Arguments]  ${coHledam}
    Sleep  2s
    Wait Until Element Is Visible  ${header_text_xpath}
    Element Should Contain  ${header_text_xpath}  ${coHledam}
    
*** Test Cases ***
Search on Mall - Lenovo
[Documentation]  Test vzhledavani Lenovo
   Maximize Browser Window
   Vyhledej slovo    Lenovo
   Zkontroluj vysledek    Lenovo


Search on Mall - Dell
[Documentation]  Test vzhledavani Dell
    Maximize Browser Window
    Vyhledej slovo    Dell
    Zkontroluj vysledek  Dell
    
    
  




     