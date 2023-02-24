# History Digit

Данный проект является проектной работой "Написание приложения с нуля".
Идея приложения заключается в том, что Вы вводите в поиске число, в фильтре выбираете тип факта о выбранном числе,
а приложение формирует запрос на API сайта http://numbersapi.com/ . Результаты поиска можно сохранять и они дальше
храняться в БД (CoreData) и фильтруются по категориям при выводе на экран в форме диаграмм.

Приложение содержит:
1. Начальный экран приложения. 
    ![](/gitImage/start.png)
2. Экран фильтра 
    ![](/gitImage/filter_1.png) 
    ![](/gitImage/filter_2.png) 
    ![](/gitImage/filter_3.png)
3. Экран результата поиска. 
    ![](/gitImage/result_1.png) 
    ![](/gitImage/result_2.png)
4. Экран диаграм
    ![](/gitImage/diagram_1.png) 
    ![](/gitImage/diagram_2.png)   
5. Экран списка всех чисел
    ![](/gitImage/list.png)
6. Экран с информацией о разработчике
    ![](/gitImage/about_me.png) 
    ![](/gitImage/about_me_git.png)
    ![](/gitImage/about_me_telegram.png)

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