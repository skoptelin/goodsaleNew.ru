Учебный проект "Доска объявлений"

Проект на Laravel+Inertia+Vue (MVC)

Выполненные задачи: 
Доска объявлений с аутентификацией пользователей;
Лента объявлений с доступом без аутентификации;
Раздел “Мои объявления” с функционалом создания,  изменения и удаления объявлений;
Адаптивная верстка для desktop и mobile устройств. 

Результат: 
Освоение фреймворка Vue и вспомогательных библиотек: Inertia, sweetalert2, vee-validate и yup.

Проектирование: 
Структура базы данных в виде блок-схем с помощью draw.io с определением сущности users и ads, определение полей для каждой из сущностей и связи между таблицами “один ко многим”.

Серверная часть:
	Подсоединение к базе данных. Модели и контроллеры. Подключение контроллеров к роутам. 
Для функционала регистрации и аутентификации пользователей была использована библиотека Laravel Breeze. Доработан сервер и клиент для сохранения номера телефона у пользователя в базе данных. Стили под необходимый дизайн,  доработаны с помощью библиотеки Tailwind. 

Клиентская часть: 
Компоненты страниц на vue: лента, мои объявления, детали, создание и изменение объявления. Для установки стилей и разметки использован препроцессор Sass. Разметку и стили использованы с готового дизайна в Figma. Для отзывчивости интерфейса при создании и изменении объявлений, сделаны popups на основе библиотеки Sweetalert2. 

Валидация и обработка ошибок: 
Для настройки валидации на сервере и клиенте при создании и редактировании объявлений использованы встроенные инструменты  на сервере. На клиенте добавлены библиотеки Vee-validate и Yup. Валидация на клиенте добавлена для скорости обработки данных, чтобы не было запроса к серверу. Использованы 2 библиотеки, так как vee-validate имеет встроенные компоненты для установки валидации и уведомления об ошибке при валидации, а yup имеет широкую и простую настройку валидации данных. 
Чтобы пользователь имел возможность воспользоваться навигацией и получал цивилизованные сообщения при появлении ошибок, настроен обработчик сообщений об ошибке.  На стороне клиента сделан глобальный обработчик ошибок в виде отдельного компонента, который встроен в родительский компонент страниц. Для отработки ответов сервера с ошибкам, использован встроенный функционал Inertia: расширены настройки exception handler на стороне сервера, который перенаправляет пользователя на компонент error на клиенте с сообщением о возникшей  проблеме.
