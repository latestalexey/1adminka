#Использовать v8runner

Перем Лог Экспорт;
Перем мНастройки Экспорт;

Перем УправлениеКонфигуратором;
Перем ОбщиеПараметрыКоманд;

Функция ИмяЛогаСистемы() Экспорт
	Возврат "1adminka";
КонецФункции

Процедура ПриРегистрацииКомандПриложения(Знач КлассыРеализацииКоманд) Экспорт
    
    КлассыРеализацииКоманд["help"] = "КомандаСправкаПоПараметрам";
    //...
    КлассыРеализацииКоманд["clean"] = "ОчисткаВременнойБазы";
    КлассыРеализацииКоманд["load-storage"] = "ЗагрузкаИзХранилища";
    //КлассыРеализацииКоманд["<имя команды>"] = "<КлассРеализации>";

КонецПроцедуры

// Одна из команд может вызываться неявно, без указания команды.
// Иными словами, здесь указывается какой обработчик надо вызывать, если приложение запущено без какой-либо команды
//  myapp /home/user/somefile.txt будет аналогично myapp default-action /home/user/somefile.txt 
Функция ИмяКомандыПоУмолчанию() Экспорт
	Возврат "help";
	// Возврат "default-action";
КонецФункции

Функция УправлениеКонфигуратором() Экспорт
	Если УправлениеКонфигуратором = Неопределено Тогда
		Логирование.ПолучитьЛог("oscript.lib.v8runner").УстановитьУровень(Лог.Уровень());
		
		УправлениеКонфигуратором = Новый УправлениеКонфигуратором();
		// УправлениеКонфигуратором.ПутьКПлатформе1С(мНастройки.ПутьК1С);
		// УправлениеКонфигуратором.КаталогСборки(мНастройки.КаталогДанныхСборки);

		// Если ИспользоватьЯвныйКонтекст() Тогда
		// 	УправлениеКонфигуратором.УстановитьКонтекст(мНастройки.ИмяБазы, мНастройки.АдминистраторБазы, ""); //мНастройки.ПарольАдминистратораБазы);
		// КонецЕсли;
	КонецЕсли;
	Логирование.ПолучитьЛог("oscript.lib.v8runner").УстановитьУровень(Лог.Уровень());
	Возврат УправлениеКонфигуратором;
КонецФункции // УправлениеКонфигуратором() Экспорт

Функция ОбщиеПараметрыКоманд() Экспорт
	Если ОбщиеПараметрыКоманд = Неопределено Тогда
		ОбщиеПараметрыКоманд = Новый Структура;
		ОбщиеПараметрыКоманд.Вставить("Каталог", "-dir");
		ОбщиеПараметрыКоманд.Вставить("КаталогХранилища", "-storage-dir");
		ОбщиеПараметрыКоманд.Вставить("ПользовательХранилища", "-storage-user");
		ОбщиеПараметрыКоманд.Вставить("ПарольХранилища", "-storage-password");
		ОбщиеПараметрыКоманд = Новый ФиксированнаяСтруктура(ОбщиеПараметрыКоманд);
	КонецЕсли;
	Возврат ОбщиеПараметрыКоманд;
КонецФункции // ОбщиеПараметрыКоманд()
// приватная часть

Функция ИспользоватьЯвныйКонтекст()
	Возврат Не ПустаяСтрока(мНастройки.ИмяБазы);
КонецФункции

Функция КаталогВнешнихПрограмм() Экспорт
	Возврат ОбъединитьПути(КаталогПроекта(), "tools");
КонецФункции

Функция КаталогТестовыхФикстур() Экспорт
	Возврат ОбъединитьПути(КаталогТестов(), "fixtures");
КонецФункции // КаталогПроекта()

Функция КаталогТестов() Экспорт
	Возврат ОбъединитьПути(КаталогПроекта(), "tests");
КонецФункции // КаталогПроекта()

Функция КаталогИсходников() Экспорт
	Возврат ОбъединитьПути(КаталогПроекта(), "src");
КонецФункции // КаталогПроекта()

Функция КаталогПроекта() Экспорт
	Возврат ОбъединитьПути(ТекущийСценарий().Каталог, "..", "..");
КонецФункции // КаталогПроекта()

Лог = Логирование.ПолучитьЛог(ИмяЛогаСистемы());
