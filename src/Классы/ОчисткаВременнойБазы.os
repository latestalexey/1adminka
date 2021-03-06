
///////////////////////////////////////////////////////////////////////////////////////////////////
// Прикладной интерфейс

Процедура ЗарегистрироватьКоманду(Знач ИмяКоманды, Знач Парсер) Экспорт
	ОбщиеКлючиКоманд.ДобавитьОбщиеПараметрыКоманд(Парсер);

	ОписаниеКоманды = Парсер.ОписаниеКоманды(ИмяКоманды, "Очистка временной базы");

	Парсер.ДобавитьКоманду(ОписаниеКоманды);
КонецПроцедуры

// Выполняет логику команды
// 
// Параметры:
//   ПараметрыКоманды - Соответствие ключей командной строки и их значений
//
Функция ВыполнитьКоманду(Знач ПараметрыКоманды) Экспорт
	ПараметрыСистемы.Лог.Информация("Удаление временной базы");
    Конфигуратор = ПараметрыСистемы.Конфигуратор(); 
	Конфигуратор.КаталогСборки(ПараметрыКоманды[ПараметрыСистемы.ОбщиеПараметрыКоманд().Каталог]);

	Конфигуратор.УдалитьВременнуюБазу();
    Возврат 0;
КонецФункции

// { приватная часть 

// }

