*** Settings ***


Library    AppiumLibrary



*** Test Cases ***

#CT001
Buscar eventos a partir do nome da cidade

    start session
    validate open homepage
    search    text=Recife
    validate result event's city    city=Recife
    close session



#CT002
Buscar eventos a partir do tipo de evento

    start session
    validate open homepage
    search    text=show
    validate result event's type    eventType=show
    close session


#CT003
Buscar eventos próximos a partir da localização inserida manualmente

    start session
    validate open homepage
    open map
    open city filter
    choose city    searchCityText=Recife
    validate map with events





*** Keywords ***
start session
    ...    Open Application    http://localhost:4723
    ...                platformName=Android
    ...                appium:deviceName=Android Emulator
    ...                appium:automationName=UIAutomator2
    ...                app=${EXECDIR}/sympla.apk
    ...                appium:udid=emulator-5554
    ...                appium:autoGrantPermissions=true

close session
    Close Application


validate open homepage
    Wait Until Element Is Visible    id=com.sympla.tickets:id/labelCollectionsItemHomeDinamica


search
    [Arguments]    ${text}
    Wait Until Page Contains Element    id=com.sympla.tickets:id/search_bar_text
    Input Text    id=com.sympla.tickets:id/search_bar_text    text=${text}
    Click Element    id=com.sympla.tickets:id/search_bar_text
    Press Keycode    keycode=66


validate result event's city
    [Arguments]    ${city}
    Wait Until Page Contains Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.TextView[3]
    Element Should Contain Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.TextView[3]    expected=${city}
    Element Should Contain Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[2]/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.TextView[3]    expected=${city}


validate result event's type
    [Arguments]    ${eventType}
    Wait Until Page Contains Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.TextView[2]
    Element Should Contain Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.TextView[2]    expected=${eventType}


open map
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.TextView


choose city
    [Arguments]    ${searchCityText}
    Input Text    id=com.sympla.tickets:id/editTxtCitiesSearch    text=${searchCityText}
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup


validate map with events
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.widget.TextView
    Element Should Contain Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.widget.TextView    expected=Mapa de eventos


open city filter
    Click Element    id=com.sympla.tickets:id/custom_button_counter
    Click Element    id=com.sympla.tickets:id/appCompatTextLocation