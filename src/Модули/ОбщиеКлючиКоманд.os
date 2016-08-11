
Процедура ДобавитьОбщиеПараметрыКоманд(Знач Парсер, Знач ОписаниеКоманды) Экспорт
	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ПараметрыСистемы.ОбщиеПараметрыКоманд().Каталог);
	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ПараметрыСистемы.ОбщиеПараметрыКоманд().УровеньЛога);
	Парсер.ДобавитьКоманду(ОписаниеКоманды);
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
