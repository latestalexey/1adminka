﻿// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

#Использовать v8runner
#Использовать tempfiles

#Использовать "..\..\src"

Перем БДД; //контекст фреймворка 1bdd

Перем Лог;
// Перем УправлениеКонфигуратором;

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("УстановилТестовыйКаталогКакТекущий");
	ВсеШаги.Добавить("ЯПодготовилТестовыйКаталогКакКаталогСборки");
	ВсеШаги.Добавить("СоздаюВременнуюФайловуюБазу");
	ВсеШаги.Добавить("ЯОчистилПараметрыКомандыПродукта");
	ВсеШаги.Добавить("ЯДобавляюКаталогСборкиКакПараметрКомандыПродукта");
	ВсеШаги.Добавить("ЯВыполняюКомандуПродуктаCПередачейПараметров");
	ВсеШаги.Добавить("ВременнаяБазаНеСуществует");
	ВсеШаги.Добавить("ПодготовилТестовоеХранилище");
	ВсеШаги.Добавить("ЯДобавляюПользователяИПарольТестовогоХранилищаКакПараметрКомандыПродукта");
	ВсеШаги.Добавить("ЯДобавляюКаталогТестовогоХранилищаКакПараметрКомандыПродукта");
	ВсеШаги.Добавить("ВЛог_ФайлеЗапускаПродуктаЕстьСтрока");
	ВсеШаги.Добавить("ВЛог_ФайлеЗапускаПродуктаОтсутствуетСтрока");
	ВсеШаги.Добавить("ВЛог_ФайлеЗапускаПродуктаЕстьСтрока_ПодходящаяПодШаблон");
	ВсеШаги.Добавить("ВФайлеЕстьСтрока");

	Возврат ВсеШаги;
КонецФункции

	// ВсеШаги.Добавить("ЯДобавляюПользователяИПарольТестовогоХранилищаКакПараметрКомандыПродукта");
	// ВсеШаги.Добавить("ЯДобавляюКаталогТестовогоХранилищаКакПараметрКомандыПродукта");
	// ВсеШаги.Добавить("ВЛог_ФайлеЗапускаПродуктаЕстьСтрока");
	// ВсеШаги.Добавить("ВЛог_ФайлеЗапускаПродуктаОтсутствуетСтрока");
	// ВсеШаги.Добавить("ВЛог_ФайлеЗапускаПродуктаЕстьСтрока_ПодходящаяПодШаблон");
	// ВсеШаги.Добавить("ВФайлеЕстьСтрока");

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
КонецПроцедуры

//я подготовил тестовый каталог как каталог сборки
Процедура ЯПодготовилТестовыйКаталогКакКаталогСборки() Экспорт
	КаталогСборки = Новый Файл(ВременныеФайлы.СоздатьКаталог());
	БДД.СохранитьВКонтекст("КаталогСборки", КаталогСборки);
	// Лог.Отладка("Использую временный каталог "+ВременныйКаталогФичи.ПолноеИмя);
	// ПараметрыСистемы.УправлениеКонфигуратором.КаталогСборки(КаталогСборки.ПолноеИмя)

	БДД.СохранитьВКонтекст("ПараметрыКоманды", "");
КонецПроцедуры

//установил тестовый каталог как текущий
Процедура УстановилТестовыйКаталогКакТекущий() Экспорт
	УстановитьТекущийКаталог(КаталогСборки());
КонецПроцедуры

//подготовил тестовое хранилище
Процедура ПодготовилТестовоеХранилище() Экспорт
	Источник = ОбъединитьПути(КаталогТестовыхФикстур(), "storage_initial.1CD");
	Приемник = ОбъединитьПути(КаталогСборки(), "1cv8ddb.1CD");
	КопироватьФайл(Источник, Приемник);
КонецПроцедуры

//я очистил параметры команды продукта
Процедура ЯОчистилПараметрыКомандыПродукта() Экспорт
	БДД.СохранитьВКонтекст("ПараметрыКоманды", Неопределено);
КонецПроцедуры

//я добавляю пользователя и пароль тестового хранилища как параметр команды продукта
Процедура ЯДобавляюПользователяИПарольТестовогоХранилищаКакПараметрКомандыПродукта() Экспорт
	ЯДобавляюПараметрКомандыПродукта("-repo-user Администратор");
	// ЯДобавляюПараметрКомандыПродукта("-repo-user Администратор -repo-password """" ");
КонецПроцедуры

//я добавляю каталог сборки как параметр команды продукта
Процедура ЯДобавляюКаталогСборкиКакПараметрКомандыПродукта() Экспорт
	ЯДобавляюПараметрКомандыПродукта("-dir "+КаталогСборки());
КонецПроцедуры


//я добавляю каталог тестового хранилища как параметр команды продукта
Процедура ЯДобавляюКаталогТестовогоХранилищаКакПараметрКомандыПродукта() Экспорт
	ЯДобавляюПараметрКомандыПродукта("-repo-dir " + КаталогСборки());
КонецПроцедуры

//я добавляю параметр команды продукта "Парам"
Процедура ЯДобавляюПараметрКомандыПродукта(Знач ПараметрКоманды) Экспорт
	ПараметрыКоманды = БДД.ПолучитьИзКонтекста("ПараметрыКоманды");
	Если ПараметрыКоманды = Неопределено Тогда
		ПараметрыКоманды = "";
	КонецЕсли;
	ПараметрыКоманды = СтрШаблон("%1 %2 ", ПараметрыКоманды, ПараметрКоманды); 
	БДД.СохранитьВКонтекст("ПараметрыКоманды", ПараметрыКоманды);
КонецПроцедуры

//я выполняю команду продукта "clean" c передачей параметров ""
Процедура ЯВыполняюКомандуПродуктаCПередачейПараметров(Знач Команда, Знач ПараметрыКоманды) Экспорт
	// Лог.УстановитьУровень(УровниЛога.Отладка);

	ОжидаемыйКодВозврата = 0;

	ПутьАдминки = ОбъединитьПути(КаталогИсходников(), "1adminka.os");
	ФайлАдминки = Новый Файл(ПутьАдминки);
	Ожидаем.Что(ФайлАдминки.Существует(), "Ожидаем, что скрипт админки существует, а его нет. "+ФайлАдминки.ПолноеИмя).Равно(Истина);

	ПараметрыКоманды = СтрШаблон("%1 %2", ПараметрыКоманды, БДД.ПолучитьИзКонтекста("ПараметрыКоманды"));

	СтрокаКоманды = СтрШаблон("oscript.exe -encoding=utf-8 %1 %2 %3", ПутьАдминки, Команда, ПараметрыКоманды);
	// Лог.Отладка("СтрокаКоманды %1", СтрокаКоманды);

	ТекстФайла = "";
	КодВозврата = ВыполнитьПроцесс(СтрокаКоманды, ТекстФайла);

	БДД.СохранитьВКонтекст("ТекстЛогФайлаПродукта", ТекстФайла);
// Лог.Ошибка(ТекстФайла);

	Если КодВозврата <> ОжидаемыйКодВозврата или Лог.Уровень() <= УровниЛога.Отладка  Тогда
	// Если КодВозврата <> ОжидаемыйКодВозврата или Лог.Уровень() <= УровниЛога.Отладка ИЛИ СтрНайти(ПараметрыКоманды, "-verbose on") <> 0 Тогда
		ВывестиТекст(ТекстФайла);
		Ожидаем.Что(КодВозврата, "Код возврата в ЯВыполняюКомандуПродуктаCПередачейПараметров").Равно(ОжидаемыйКодВозврата);
	КонецЕсли;
	// ВызватьИсключение 1;
КонецПроцедуры

//создаю временную файловую базу
Процедура СоздаюВременнуюФайловуюБазу() Экспорт
	УправлениеКонфигуратором = УправлениеКонфигуратором();

	Если ВременнаяБазаСуществует() Тогда
		УдалитьФайлы(УправлениеКонфигуратором.ПутьКВременнойБазе());
	КонецЕсли;

	Ожидаем.Что(ВременнаяБазаСуществует(), "Временной базы не должно быть в каталоге <"+УправлениеКонфигуратором.ПутьКВременнойБазе()+">").Равно(Ложь);

	УправлениеКонфигуратором.СоздатьФайловуюБазу(УправлениеКонфигуратором.ПутьКВременнойБазе());
	Сообщить(УправлениеКонфигуратором.ВыводКоманды());

	Ожидаем.Что(ВременнаяБазаСуществует(), "Временная база должна существовать").Равно(Истина);
КонецПроцедуры

//в лог-файле запуска продукта есть строка, подходящая под шаблон "Обновление конфигурации\s*(базы данных)?\s*успешно завершено"
Процедура ВЛог_ФайлеЗапускаПродуктаЕстьСтрока_ПодходящаяПодШаблон(Знач ШаблонРегулярногоВыражения) Экспорт
	ТекстЛогФайла = БДД.ПолучитьИзКонтекста("ТекстЛогФайлаПродукта");
	РегулярноеВыражение = Новый РегулярноеВыражение(ШаблонРегулярногоВыражения);
	Ожидаем.Что(РегулярноеВыражение.Совпадает(ТекстЛогФайла), "Строка не подходит под шаблон регулярного выражения "+ШаблонРегулярногоВыражения).Равно(Истина);
КонецПроцедуры

//в файле "clean.log" есть строка "ыва"
Процедура ВФайлеЕстьСтрока(Знач ПутьФайла, Знач ПроверяемаяСтрока) Экспорт
	Файл = Новый Файл(ОбъединитьПути(ТекущийКаталог(), ПутьФайла)); 
	ЕстьПодстрока(ПрочитатьТекстФайла(Файл), ПроверяемаяСтрока);
КонецПроцедуры

//в лог-файле запуска продукта есть строка "ЯЗапускаюПадающийШагСПараметром-Первый падающий шаг"
Процедура ВЛог_ФайлеЗапускаПродуктаЕстьСтрока(Знач ПроверяемаяСтрока) Экспорт
	ТекстЛогФайла = БДД.ПолучитьИзКонтекста("ТекстЛогФайлаПродукта");
	ЕстьПодстрока(ТекстЛогФайла, ПроверяемаяСтрока);
КонецПроцедуры

Функция ПрочитатьТекстФайла(Знач Файл)
	ЧтениеТекста = Новый ЧтениеТекста;
	ЧтениеТекста.Открыть(Файл.ПолноеИмя,"UTF-8");

	Строка = ЧтениеТекста.Прочитать();
	ЧтениеТекста.Закрыть();
	Возврат Строка;
КонецФункции // ПрочитатьТекстФайла()

Процедура ЕстьПодстрока(Знач Строка, Знач ПроверяемаяСтрока)
	Если СтрЧислоСтрок(ПроверяемаяСтрока) = 1 Тогда
		Ожидаем.Что(Строка, "Проверяем одиночную строку").Содержит(ПроверяемаяСтрока);
	Иначе
		ПроверитьЧтоМногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Строка, ПроверяемаяСтрока);
	КонецЕсли;
КонецПроцедуры
//TODO перенести в ассерты oscript-library
Процедура ПроверитьЧтоМногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Знач Строка, Знач Подстрока, ДопСообщениеОшибки = "")
		СообщениеОшибки = "";
		Нашли = МногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Строка, Подстрока, СообщениеОшибки);
		Если Не Нашли Тогда
			ВызватьИсключение СтрШаблон("Ожидали, что в строке <
			|%1
			|>
			|найдем подстроку<
			|%2
			|>
			|А это не так.
			|Уточнение: %3.
			|%4", Строка, Подстрока, СообщениеОшибки, ДопСообщениеОшибки);
		КонецЕсли;
КонецПроцедуры

Функция МногострочнаяСтрокаСодержитПодстрокуБезУчетаНачальныхКонечныхПробеловВПодстроках(Знач Строка, Знач Подстрока, СообщениеОшибки = "")
	ПерваяСтрока = СокрЛП(СтрПолучитьСтроку(Подстрока, 1));
	НашлиПервуюСтроку = Ложь;
	Для Счетчик = 1 По СтрЧислоСтрок(Строка) Цикл
		ОчереднаяСтрока = СокрЛП(СтрПолучитьСтроку(Строка, Счетчик));
		НашлиПервуюСтроку = Найти(ОчереднаяСтрока, ПерваяСтрока) <> 0;
		Если НашлиПервуюСтроку Тогда
			Прервать;
		КонецЕсли;
	КонецЦикла;
	Если Не НашлиПервуюСтроку Тогда
		СообщениеОшибки = СтрШаблон("Не нашли первую же подстроку <%1>", ПерваяСтрока);
		Возврат Ложь;
	КонецЕсли;

	СчетчикЧтоИщем = 2;
	Для Счетчик = Счетчик+1 По СтрЧислоСтрок(Строка) Цикл
		ОчереднаяСтрока = СокрЛП(СтрПолучитьСтроку(Строка, Счетчик));
		ЧтоИщем = СокрЛП(СтрПолучитьСтроку(Подстрока, СчетчикЧтоИщем));
		Поз = Найти(ОчереднаяСтрока, ЧтоИщем);
		Если Поз = 0 Тогда
			СообщениеОшибки = СтрШаблон("Не нашли подстроку № %1 <%2>", СчетчикЧтоИщем, ЧтоИщем);
			Возврат Ложь;
		Иначе
			СчетчикЧтоИщем  = СчетчикЧтоИщем  + 1;
			Если СчетчикЧтоИщем > СтрЧислоСтрок(Подстрока) Тогда
				Возврат Истина;
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	Возврат СчетчикЧтоИщем > СтрЧислоСтрок(Подстрока);
КонецФункции

//в лог-файле запуска продукта отсутствует строка "ДоЭтогоШагаВыполнениеДойтиНеДолжно"
Процедура ВЛог_ФайлеЗапускаПродуктаОтсутствуетСтрока(Знач ПроверяемаяСтрока) Экспорт
	ТекстЛогФайла = БДД.ПолучитьИзКонтекста("ТекстЛогФайлаПродукта");
	Ожидаем.Что(ТекстЛогФайла).ЭтоНе().Содержит(ПроверяемаяСтрока);
КонецПроцедуры

Функция УправлениеКонфигуратором()
	УправлениеКонфигуратором = Новый УправлениеКонфигуратором;
	УправлениеКонфигуратором.КаталогСборки(КаталогСборки());
	Возврат УправлениеКонфигуратором;
КонецФункции // УправлениеКонфигуратором()

//временная база не существует
Процедура ВременнаяБазаНеСуществует() Экспорт
	УправлениеКонфигуратором = УправлениеКонфигуратором();
	Ожидаем.Что(ВременнаяБазаСуществует(), "Временной базы не должно быть в каталоге <"+УправлениеКонфигуратором.ПутьКВременнойБазе()+">").Равно(Ложь);
КонецПроцедуры


Функция ВременнаяБазаСуществует()
	Возврат УправлениеКонфигуратором().ВременнаяБазаСуществует();
КонецФункции // ВременнаяБазаСуществует()

Функция ВыполнитьПроцесс(Знач СтрокаВыполнения, ТекстВывода, Знач КодировкаПотока = Неопределено)
	Перем ПаузаОжиданияЧтенияБуфера;
	
	ПаузаОжиданияЧтенияБуфера = 10;
	МаксСчетчикЦикла = 100000;
	
	Если КодировкаПотока = Неопределено Тогда
		КодировкаПотока = КодировкаТекста.UTF8;
	КонецЕсли;
    Лог.Отладка("СтрокаКоманды %1", СтрокаВыполнения);

	Процесс = СоздатьПроцесс(СтрокаВыполнения, ТекущийКаталог(), Истина,Истина, КодировкаПотока);
    Процесс.Запустить();
	
	ТекстВывода = "";
	Счетчик = 0; 
	
	Пока Не Процесс.Завершен Цикл 
		Текст = Процесс.ПотокВывода.Прочитать();
		// Лог.Отладка("Цикл ПотокаВывода "+Текст);
		Если Текст = Неопределено ИЛИ ПустаяСтрока(Текст)  Тогда 
			Прервать;
		КонецЕсли;
		ТекстВывода = ТекстВывода + Текст;

		Счетчик = Счетчик + 1;
		Если Счетчик > МаксСчетчикЦикла Тогда 
			Прервать;
		КонецЕсли;
		
		sleep(ПаузаОжиданияЧтенияБуфера);		
	КонецЦикла;
	
	Процесс.ОжидатьЗавершения();
    
	Текст = Процесс.ПотокВывода.Прочитать();
	ТекстВывода = ТекстВывода + Текст;
	Лог.Отладка(ТекстВывода);

	Возврат Процесс.КодВозврата;
КонецФункции

Процедура ВывестиТекст(Знач Строка)

	Лог.Информация("");
	Лог.Информация("  ----------------    ----------------    ----------------  ");
	Лог.Информация( Строка );
	Лог.Информация("  ----------------    ----------------    ----------------  ");
	Лог.Информация("");

КонецПроцедуры

Функция КаталогСборки()
	Возврат БДД.ПолучитьИзКонтекста("КаталогСборки").ПолноеИмя;	
КонецФункции // КаталогТестовогоХранилища()

Функция КаталогТестовыхФикстур() Экспорт
	Возврат ОбъединитьПути(КаталогТестов(), "fixtures");
КонецФункции // КаталогИсходников()

Функция КаталогТестов() Экспорт
	Возврат ОбъединитьПути(КаталогИсходников(), "..", "tests");
КонецФункции // КаталогИсходников()

Функция КаталогИсходников() Экспорт
	КаталогПроекта = ОбъединитьПути(ТекущийСценарий().Каталог, "..", "..");
	Возврат ОбъединитьПути(КаталогПроекта, "src");
КонецФункции // КаталогИсходников()

Лог = ПараметрыСистемы.Лог;
