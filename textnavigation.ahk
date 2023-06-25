;**********************************************************************
;	Author: Kilobyter
;	Create:  2019
;	Last Change: 25/06/2023
;
;	Description: 
; 	1. Скрипт  настраивает навигацию как в ergoemacs
; 	2. ON/OFF Автозакрывание скобок и кавычек (), {}, [], '', "" клавишей ScrollLock
;	3. Вставка своего номера телефона и почтового ящика
;	4. Перенастройка доп. клавиш клавиатуры почты и домашней страницы
;	4. Смена раскладки клавиатуры клавишей Ctrl+Shift
;**********************************************************************



;--------------------------------------------------------------------------
;	Навигация как в ergoemacs
;--------------------------------------------------------------------------
#SingleInstance Force
;Menu, Tray, Icon, Shell32.dll, 42

SetKeyDelay, 0

;перемещение курсора
!sc26::send {Right}		; Alt + L				перемещение курсора вправо
!д::send {Right}
!sc23::send {Left}			; Alt + H				перемещение курсора влево
!р::send {Left}
!sc25::send {Up}				; Alt + K				перемещение курсора вверх
!л::send {Up}
!sc24::send {Down}		; Alt + J				перемещение курсора вниз
!о::send {Down}
!sc18::send ^{Right}		; Alt + O				перемещение курсора в конец слова
!щ::send ^{Right}
!sc16::send ^{Left}			; Alt +U				перемещение курсора в начало слова
!г::send ^{Left}
!+sc17::send {Home}		; Alt +Shift +I		перемещение курсора в начало строки
!+ш::send {Home}
!sc17::send {End}			; Alt + I				перемещение курсора в конец строки
!ш::send {End}

;удаление

!sc21::send {Delete}				; Alt + R		удаление символа справа
!а::send {Delete}
!sc20::send {BackSpace}		; Alt + D		удаление символа слева
!в::send {BackSpace}
!sc12::send ^{Backspace}		; Alt + E		удаление слова слева от курсора
!у::send ^{Backspace}
!sc13::send ^{Delete}			; Alt + R		удаление слова справа от курсора
!к::send ^{Delete}

;--------------------------------------------------------------------------
;	Кавычки, скобки
;--------------------------------------------------------------------------
BracketMode := 0 ; режим автозавершения скобок 1-вкл, 0-выкл

bracket_mode(ByRef BracketM){
	
	
	if (BracketM <> 1) {
		BracketM := 1		
		TrayTip, #1,  Автозакрывание скобок ON, ,1
		return
	}
	else{
		BracketM := 0		
		TrayTip, #2,  Автозакрывание скобок OFF, ,1
		return
	}
}


sc46::
{
	bracket_mode(BracketMode)
	return
}
:b0*:(::
{
	if (BracketMode == 1){
		send, {)}
		send, {Left}
		return
	}
	else return
}

:b0*:{::
{
	if (BracketMode == 1){
		send, {}}
		send, {Left}
		return
	}
	else return
}

:b0*:[::
{
	if (BracketMode == 1){
		send, {]}
		send, {Left}
		return
	}
	else return
}

:b0*:`"::
{
	if (BracketMode == 1){
		send, {`"}
		send, {Left}
		return
	}
	else return
}

:b0*:'::
{
	if (BracketMode == 1){
		send, {'}
		send, {Left}
		return
	}
	else return
}

;~ :b0*:%::
;~ {
	;~ if (BracketMode == 1){
		;~ send, {`%}
		;~ send, {Left}
		;~ return
	;~ }
	;~ else return
;~ }

;--------------------------------------------------------------------------
;	Настройка клавиши домашней страницы и почты
;--------------------------------------------------------------------------
vkB4::Run, www.google.com/mail/
vkAC::Run, www.yandex.ru


;--------------------------------------------------------------------------
;	Справка
;--------------------------------------------------------------------------
F12::MsgBox, 64, Справка, Перемещение курсора:`nAlt + H - влево`nAlt + L - вправо`nAlt + K - вверх`nAlt + J - вниз`nAlt + I - в конец строки`nAlt + Shift + I - в начало строки`n`nУдаление:`nAlt + D - слева`nAlt + F - справа`nAlt + E - слово слева`nAlt + R - слово справа`nScrollLock - ON/OFF автозавершения скобок и кавычек`nF12 - справка

^Esc::ExitApp