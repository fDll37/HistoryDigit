# History Digit

Данный проект является проектной работой "Написание приложения с нуля".
Идея приложения заключается в том, что Вы вводите в поиске число, в фильтре выбираете тип факта о выбранном числе,
а приложение формирует запрос на API сайта http://numbersapi.com/ . Результаты поиска можно сохранять и они дальше
храняться в БД (CoreData) и фильтруются по категориям при выводе на экран в форме диаграмм.

Приложение содержит:
1. Начальный экран приложения. 
<img src="/gitImage/start.png" width="500">
2. Экран фильтра 
<img src="/gitImage/filter_1.png" width="500">
<img src="/gitImage/filter_2.png" width="500">
<img src="/gitImage/filter_3.png" width="500">
3. Экран результата поиска. 
<img src="/gitImage/result_1.png" width="500">
<img src="/gitImage/result_2.png" width="500">
4. Экран диаграм
<img src="/gitImage/diagram_1.png" width="500">
<img src="/gitImage/diagram_2.png" width="500">
5. Экран списка всех чисел
<img src="/gitImage/list.png" width="500">
6. Экран с информацией о разработчике
<img src="/gitImage/about_me.png" width="500">
<img src="/gitImage/about_me_git.png" width="500">
<img src="/gitImage/about_me_telegram.png" width="500">


Реализовано "под капотом":
1. Анимация разработана "с нуля".
2. Реализован паттерны Singleton, State, Binding, Observed
3. Применение MVC
4. Применение MVVM
5. Работа с API (с фильтрацией по типу информации о числе)
6. Построение круговой диаграмы (плюс анимация)
7. Построение гистограмы
8. Взаимодействие с WebKit (отображение git и telegram)
9. Организовано хранение в CoreData
10. Работает на SwiftUI