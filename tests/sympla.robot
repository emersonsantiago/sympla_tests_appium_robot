*** Settings ***


Library    AppiumLibrary



*** Test Cases ***

#CT001
Buscar eventos a partir do nome da cidade e validar resultados

    start session
    validate open homepage
    search    text=Recife
    validate result event's city    city=Recife
    close session



#CT002
Buscar eventos a partir do tipo de evento e validar resultados

    start session
    validate open homepage
    search    text=show
    validate result event's type    eventType=show
    close session


#CT003
Obter eventos próximos a partir da localização inserida manualmente e validar

    start session
    validate open homepage
    open map
    open city filter
    choose city    searchCityText=Recife
    apply filter
    validate map with events
    close session


#CT004
Favoritar e desfavoritar o evento mais visto nas últimas 24h

    start session
    login    emailAccount=rigem97173@dabeixin.com    password=Senha@2023
    include event most seen to favorite list
    validate event in favorite list
    delete event from favorite list
    close session






*** Keywords ***
login
    [Arguments]    ${emailAccount}    ${password}
    Wait Until Page Contains Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout[5]/android.widget.TextView    timeout=20
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout[5]/android.widget.TextView
    Wait Until Page Contains Element    id=com.sympla.tickets:id/profile_btn_enter    timeout=20
    Click Element    id=com.sympla.tickets:id/profile_btn_enter
    Wait Until Page Contains Element    id=com.sympla.tickets:id/login_collapsing_toolbar    timeout=20
    Input Text    id=com.sympla.tickets:id/email    text=${emailAccount}
    Input Text    id=com.sympla.tickets:id/password    text=${password}
    Click Element    id=com.sympla.tickets:id/password
    Click Element    id=com.sympla.tickets:id/enter
    Wait Until Element Is Visible    id=com.sympla.tickets:id/txtProfileUserEmail    timeout=20
    Element Should Contain Text    id=com.sympla.tickets:id/txtProfileUserEmail    expected=${emailAccount}
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout[1]/android.widget.TextView
    Wait Until Page Contains Element    id=com.sympla.tickets:id/labelCollectionsItemHomeDinamica    timeout=20


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
    Wait Until Page Contains Element    id=com.sympla.tickets:id/labelCollectionsItemHomeDinamica    timeout=20


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
    Wait Until Page Contains Element    id=com.sympla.tickets:id/editTxtCitiesSearch    timeout=20
    Input Text    id=com.sympla.tickets:id/editTxtCitiesSearch    text=${searchCityText}
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup


validate map with events
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.widget.TextView
    Element Should Contain Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.widget.TextView    expected=Mapa de eventos


open city filter
    Wait Until Page Contains Element    id=com.sympla.tickets:id/custom_button_counter    timeout=20
    Click Element    id=com.sympla.tickets:id/custom_button_counter
    Wait Until Page Contains Element    id=com.sympla.tickets:id/appCompatTextLocation    timeout=20
    Click Element    id=com.sympla.tickets:id/appCompatTextLocation


apply filter
    Wait Until Page Contains Element    id=com.sympla.tickets:id/appCompatButtonFilterApply
    Click Element    id=com.sympla.tickets:id/appCompatButtonFilterApply


include event most seen to favorite list
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.ViewGroup/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.ImageView[3]


validate event in favorite list
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout[4]/android.widget.TextView
    Wait Until Element Is Visible    id=com.sympla.tickets:id/sympla_event_title    timeout=20


delete event from favorite list
    Click Element    id=com.sympla.tickets:id/floating_fav_button_image
    Sleep    time_=2
    Page Should Not Contain Element    id=com.sympla.tickets:id/sympla_event_title
    Wait Until Page Contains Element    id=com.sympla.tickets:id/app_empty_state_text    timeout=20
    Element Should Contain Text    id=com.sympla.tickets:id/app_empty_state_text    expected=Nenhum evento favoritado