# Test_Project
## Тестовое задание на iOS-разработчика в Авито

### Техническое задание:

- Написать приложение для iOS. Приложение должно состоять из одного экрана со списком. 
- Список данных в формате JSON приложение загружает из интернета по ссылке, необходимо распарсить эти данные и отобразить их в списке.
- Приложение работает на iOS 13 и выше;
- Реализована поддержка iPhone и iPad;
- Список отсортирован по алфавиту;
- Кэширование ответа на 1 час;
- Обработаны случаи потери сети / отсутствия соединения;
- Внешний вид приложения: по возможности, лаконичный, но, в целом, на усмотрение кандидата;
- Приложение написано на языке Swift;
- Пользовательский интерфейс приложения настроен в InterfaceBuilder (в Storiboard или Xib файлы) или кодом без использования SwiftUI;
- Для отображения списка используется UITableView, либо UICollectionView;
- Для запроса данных используется URLSession.


### Основной стэк:
VIPER, UIKit, UITableView, UserDefaults, NSFileManager, URLSession, верстка кодом.

### Краткое описание:
Приложение загружает из интернета список сотрудников и сохраняет его в кэш.

### Подробное описание:
1. Проект написан на UIKit без использования SwiftUI, верстка - кодом;
2. Приложение работает на iOS 13 и выше;
3. Использована архитектура VIPER;
4. Для отображения данных, отсортированных в алфавитном порядке, использован UITableView;
5. Для запроса данных используется URLSession;
6. Данные из сети сохраняются в кэш с помощью NSFileManager, путь к файлу хранится в UserDefaults.
7. Удаление данных из кэша происходит с помощью вызова функции таймером.
8. Обработаны случаи потери сети, отсутствия соединения.
- В случае потери сети отображается Alert Controller.
9. Реализована поддержка iPad;

### Что можно было бы улучшить (не реализовано ввиду ограниченного кол-ва времени):
- Добавить Navigation Controller;
- Добавить функцию pull to refresh;
- Изменить логику удаления файла с кэшем по таймеру;
- Добавить DTO-модель для удобства работы с полученной от сервера моделью;
- Добавить фотографии сотрудников;
- Убрать колфликты constraints ;
- Улучшить сортировку для совпадающих имен;
- Предусмотреть вариант большого количества skills у сотрудника и корректно отобразить их на экране;
- Улучшить UI: добавить activity Indicator во время загрузки данных, наполнить Launch Screen, добавить иконку для приложения.

