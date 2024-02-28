*** Setting ***
Library         AppiumLibrary
Resource         ../Resource/android_res.robot

*** Variables ***

${USER1-PHONE-NUMBER}               07413556678
${USER1-PHONE-NUMBER-RESTRICTED}    14107413556678
${USER2-PHONE-NUMBER}               07413556678
${MAIN-MENU-BUTTON}		//android.widget.ImageView[@index="1"]
${MAIN-SETTING-BUTTON}		id=com.google.android.dialer:id/content
${MAIN-SETTING-BUTTON2}		//android.widget.TextView[@text="Setting"]

*** Test Cases ***
#CLI-Presented Call
#    Open Call Application
#    Make Call       ${USER2-PHONE-NUMBER}
#    End Call
#
#CLI-Restricted Call
#    Open Call Application
#    Make Call       ${USER1-PHONE-NUMBER-RESTRICTED}
#    End Call

Conf Call
    Open Call Application
    Create CFU    ${USER2-PHONE-NUMBER}



#Hold and resume
#CFU
#CFB
#CFNA
#