
Процедура ДобавитьОбщиеПараметрыКоманд(Знач Парсер) Экспорт
	Парсер.ДобавитьИменованныйПараметр(ПараметрыСистемы.ОбщиеПараметрыКоманд().Каталог, "Каталог сборки", Истина);
	Парсер.ДобавитьИменованныйПараметр(ПараметрыСистемы.ОбщиеПараметрыКоманд().УровеньЛога, "Включен режим отладки логов (on - включен, off - выключен)", Истина);
КонецПроцедуры

Процедура УстановитьРежимОтладкиПриНеобходимости(Знач Параметры) Экспорт
	// Если Параметры["-debug"] = "on" Тогда
	// 	Лог.УстановитьУровень(УровниЛога.Отладка);
	// 	УдалятьВременныеФайлы = Ложь;
	// КонецЕсли;
	Если Параметры["-verbose"] = "on" Тогда
		ПараметрыСистемы.Лог.УстановитьУровень(УровниЛога.Отладка);
	КонецЕсли;
КонецПроцедуры
