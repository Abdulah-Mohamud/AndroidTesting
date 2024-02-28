*** Setting ***
Library         AppiumLibrary

*** Variables ***
#*** Emulator ***
#${DeviceName}                 emulator-5554
#${MAIN-KEYPAD-BUTTON}         id=com.android.dialer:id/fab
#${KEYPAD-CALL-BUTTON}         id=com.android.dialer:id/dialpad_floating_action_button
#${KEYPAD-ADD-CALL-BUTTON}     id=com.android.dialer:id/incall_fourth_button
#${KEYPAD-END-BUTTON}          id=com.android.dialer:id/incall_end_call
#${KEYPAD-MERGE-BUTTON}        id=com.android.dialer:id/incall_fourth_button

#*** Application details ***
${LocalHost}            http://localhost:4723/wd/hub
${PlatformName}         Android

${DeviceName}           d4c973ef
${appPackage}           com.google.android.dialer
${appActivity}          com.android.dialer.main.impl.MainActivity
${automationName}       Uiautomator2

#*** Main Page ***
${MAIN-KEYPAD-BUTTON}                   id=com.google.android.dialer:id/dialpad_fab
${MAIN-MENU-BUTTON}	                	//android.widget.ImageView[@index="1"]
${SETTING-CALLING-ACCOUNTS-BUTTON}		//android.widget.LinearLayout[@index="6"]
${SETTING-OPERATOR-SETTING-BUTTON}		//android.widget.LinearLayout[@index="3"]
${SETTING-CALL-FORWARDING-BUTTON}		//android.widget.LinearLayout[@index="2"]
${SETTING-CALL-FORWARDING-BUTTON}		//android.widget.LinearLayout[@index="2"]
${SETTING-ALWAYS-FORWARDING-BUTTON}		id=com.android.phone:id/switch_layout
${SETTING-INPUT-FORWARDING-FIELD}		id=android:id/edit
${SETTING-OK-BUTTON}		            id=android:id/button1

#*** Keypad ***
${KEYPAD-DIGITS-FIELD}        id=com.google.android.dialer:id/digits
${KEYPAD-CALL-BUTTON}         id=com.google.android.dialer:id/dialpad_voice_call_button
${KEYPAD-MORE-BUTTON}         id=com.google.android.dialer:id/entry_icon
#${KEYPAD-ADD-CALL-BUTTON}     id=com.google.android.dialer:id/entry_icon
${KEYPAD-END-BUTTON}          id=com.google.android.dialer:id/incall_end_call
#${KEYPAD-MERGE-BUTTON}        id=com.android.dialer:id/incall_fourth_button


*** Keywords ***
Open Call Application
    Open Application    ${LocalHost}    platformName=${PlatformName}    deviceName=${DeviceName}  appPackage=${appPackage}    appActivity=${appActivity}  automationName=${automationName}

Make Call
    [Arguments]                         ${PHONE-NUMBER}
    Wait Until Page Contains Element    ${MAIN-KEYPAD-BUTTON}
    Click Element                       ${MAIN-KEYPAD-BUTTON}
    Wait Until Page Contains Element    ${KEYPAD-DIGITS-FIELD}
    Input Text                          ${KEYPAD-DIGITS-FIELD}    ${PHONE-NUMBER}
    Wait Until Page Contains Element    ${KEYPAD-CALL-BUTTON}
    #Wait Activity    activity    timeout
    Click Element                       ${KEYPAD-CALL-BUTTON}

Add Call While In Call
    [Arguments]                         ${ADD-CALL}
    Wait Until Page Contains Element    ${KEYPAD-ADD-CALL-BUTTON}
    Click Element                       ${KEYPAD-ADD-CALL-BUTTON}
    Input Text                          ${KEYPAD-DIGITS-FIELD}    ${ADD-CALL}
    Click Element                       ${KEYPAD-CALL-BUTTON}
    Click Element                       ${KEYPAD-MERGE-BUTTON}

End Call
    Wait Until Page Contains Element    ${KEYPAD-END-BUTTON}
    Click Element                       ${KEYPAD-END-BUTTON}

Create CFU
    [Arguments]                         ${FORWARDING-NUMBER}
    Click Element    ${MAIN-MENU-BUTTON}
    Click Text    Settings
    Wait Until Page Contains Element    ${SETTING-CALLING-ACCOUNTS-BUTTON}
    Click Element                       ${SETTING-CALLING-ACCOUNTS-BUTTON}
    Wait Until Page Contains Element    ${SETTING-OPERATOR-SETTING-BUTTON}
    Click Element                       ${SETTING-OPERATOR-SETTING-BUTTON}
    Wait Until Page Contains Element    ${SETTING-CALL-FORWARDING-BUTTON}
    Click Element                       ${SETTING-CALL-FORWARDING-BUTTON}
    Wait Until Page Contains Element    ${SETTING-ALWAYS-FORWARDING-BUTTON}
    Click Element                       ${SETTING-ALWAYS-FORWARDING-BUTTON}
    Input Text                          ${SETTING-INPUT-FORWARDING-FIELD}    ${FORWARDING-NUMBER}
    Click Element                       ${SETTING-OK-BUTTON}