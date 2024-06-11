*** Settings ***
Library           Browser

*** Test Cases ***
Accordion Panel Expansion
    [Documentation]    Verify that accordion panels expand when clicked
    Go To    https://demoqa.com/accordion
    Click    xpath=//div[@id='section1Heading']
    Wait Until Element Is Visible    xpath=//div[@id='section1Content']
    Element Should Be Visible    xpath=//div[@id='section1Content']

Auto Complete Suggestions
    [Documentation]    Validate auto-complete suggestions
    Go To    https://demoqa.com/autocomplete
    Input Text    id=autoCompleteMultipleInput    App
    Wait Until Element Is Visible    xpath=//div[@class='auto-complete__multi-value__label']
    Element Should Contain    xpath=//div[@class='auto-complete__multi-value__label']    Apple

Date Picker Selection
    [Documentation]    Choose a date from the date picker
    Go To    https://demoqa.com/datepicker
    Click    id=datePickerMonthYearInput
    Click    xpath=//div[@class='react-datepicker__month']//div[text()='May']
    Click    xpath=//div[@class='react-datepicker__day react-datepicker__day--015']
    Element Should Contain    id=datePickerMonthYearInput    05/15/2023

Menu Context Menu
    [Documentation]    Verify context menu functionality
    Go To    https://demoqa.com/menu
    Right Click    xpath=//div[@id='rightClickBtn']
    Element Should Be Visible    xpath=//div[@class='context-menu-item context-menu-icon context-menu-icon-copy']

Slider Adjustment
    [Documentation]    Test slider handle movement
    Go To    https://demoqa.com/slider
    Drag And Drop By Offset    xpath=//input[@type='range']    50    0
    Element Should Contain    xpath=//input[@type='range']    50

Progress Bar Validation
    [Documentation]    Confirm progress bar behavior
    Go To    https://demoqa.com/progressbar
    Click    xpath=//div[@role='progressbar']
    Element Should Contain    xpath=//div[@role='progressbar']    100%

Tabs Switching
    [Documentation]    Navigate between tabs
    Go To    https://demoqa.com/tabs
    Click    xpath=//div[@id='demo-tab-what']
    Element Should Be Visible    xpath=//div[@id='demo-tabpane-what']

Tool Tips Hover
    [Documentation]    Check if tooltips appear on hover
    Go To    https://demoqa.com/tooltips
    Mouse Over    xpath=//button[@id='toolTipButton']
    Element Should Be Visible    xpath=//div[@class='tooltip-inner']

Select Menu Options
    [Documentation]    Select items from the dropdown
    Go To    https://demoqa.com/selectmenu
    Click    id=oldSelectMenu
    Click    xpath=//div[@class='css-26l3qy-menu']//div[text()='Group 1, option 1']
    Element Should Contain    id=oldSelectMenu    Group 1, option 1
