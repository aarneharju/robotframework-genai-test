*** Settings ***
Library           Browser
Suite Setup       New Browser    chromium    headless=False    slowMo=500ms


*** Test Cases ***
Accordion Panel Expansion
    [Documentation]            Verify that accordion panels expand when clicked
    [Tags]                     accordion
    New Page                   https://demoqa.com/accordian    wait_until=domcontentloaded

    Click accordion panel elements and validate that they expand and contract

Auto Complete Suggestions
    [Documentation]            Validate auto-complete suggestions
    [Tags]                     auto-complete
    New Page                   https://demoqa.com/auto-complete    wait_until=domcontentloaded

    Type gr - select green - validate auto-completion
    Type re - select red - validate auto-completion

    
Date Picker Selection
    [Documentation]            Choose a date from the date picker
    [Tags]                     date-picker
    New Page                   https://demoqa.com/date-picker
    Click                      id=datePickerMonthYearInput
    Click                      xpath=//select[@class="react-datepicker__year-select"]
    Keyboard Input             type    2023
    Keyboard Key               down    Enter
    Click                      xpath=//select[@class="react-datepicker__month-select"]
    Keyboard Input             type    May
    Keyboard Key               down    Enter
    Click                      xpath=//*[@class='react-datepicker__day react-datepicker__day--015']
    Get Attribute              id=datePickerMonthYearInput    value    ==    05/15/2023
       

# Menu Context Menu
#     [Documentation]    Verify context menu functionality
#     Go To    https://demoqa.com/menu
#     Right Click    xpath=//div[@id='rightClickBtn']
#     Element Should Be Visible    xpath=//div[@class='context-menu-item context-menu-icon context-menu-icon-copy']

# Slider Adjustment
#     [Documentation]    Test slider handle movement
#     Go To    https://demoqa.com/slider
#     Drag And Drop By Offset    xpath=//input[@type='range']    50    0
#     Element Should Contain    xpath=//input[@type='range']    50

# Progress Bar Validation
#     [Documentation]    Confirm progress bar behavior
#     Go To    https://demoqa.com/progressbar
#     Click    xpath=//div[@role='progressbar']
#     Element Should Contain    xpath=//div[@role='progressbar']    100%

# Tabs Switching
#     [Documentation]    Navigate between tabs
#     Go To    https://demoqa.com/tabs
#     Click    xpath=//div[@id='demo-tab-what']
#     Element Should Be Visible    xpath=//div[@id='demo-tabpane-what']

# Tool Tips Hover
#     [Documentation]    Check if tooltips appear on hover
#     Go To    https://demoqa.com/tooltips
#     Mouse Over    xpath=//button[@id='toolTipButton']
#     Element Should Be Visible    xpath=//div[@class='tooltip-inner']

# Select Menu Options
#     [Documentation]    Select items from the dropdown
#     Go To    https://demoqa.com/selectmenu
#     Click    id=oldSelectMenu
#     Click    xpath=//div[@class='css-26l3qy-menu']//div[text()='Group 1, option 1']
#     Element Should Contain    id=oldSelectMenu    Group 1, option 1


*** Keywords ***
Click accordion panel elements and validate that they expand and contract
    Wait For Elements State    xpath=//div[@id='section1Content']    state=visible
    Click                      xpath=//div[@id='section1Heading']
    Wait For Elements State    xpath=//div[@id='section1Content']    state=hidden
    Click                      xpath=//div[@id='section3Heading']
    Wait For Elements State    xpath=//div[@id='section3Content']    state=visible

Type gr - select green - validate auto-completion
    Type Text                  id=autoCompleteMultipleInput    gr
    ${innerHtmlMultiColors}    Get Property    css=.auto-complete__menu    innerHTML
    Log                        ${innerHtmlMultiColors}
    Click                      xpath=//*[contains(@class, "auto-complete__option")][contains(text(), "Green")]
    Wait For Elements State    xpath=//*[contains(@class, "auto-complete__multi-value__label")][contains(text(), "Green")]    state=visible

Type re - select red - validate auto-completion
    Type Text                  id=autoCompleteSingleInput    re
    ${innerHtmlSingleColor}    Get Property    css=.auto-complete__menu    innerHTML
    Log                        ${innerHtmlSingleColor}
    Click                      xpath=//*[contains(@class, "auto-complete__option")][contains(text(), "Red")]
    Wait For Elements State    xpath=//*[contains(@class, "auto-complete__single")][contains(text(), "Red")]    state=visible
