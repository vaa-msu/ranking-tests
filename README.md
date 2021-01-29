# ranking-tests

Here are some tests with rankings published by various authors.

## Рекурсивный вариант эвристического алгоритма Литвака

-   [Поведение реализаций эвристического алгоритма](RecursiveHeuristicAlgorithm.ipynb)

## Примеры ранжирований, упоминаемые в литературе

-   [Truchon (1998)](Truchon_%281998%29.ipynb)

    В статье приводятся три набора ранжирований, из которых анализируется лишь первый (ISU, пример в табл.1).
    Возможно, в этом примере имеются опечатки в ранжированиях, поэтому были проанализированы два варианта этих ранжирований. Оба дали одинаковые результаты, не совпадающие с приводимыми в статье.

-   [Lundh (2006)](Lundh_%282006%29.ipynb)

    Пример интересен тем, что в одном из оптимальных ранжирований альтернатива 2 оказывается на первом месте, а во втором -- на последнем. Или, выражаясь «турнирным» языком, вторая команда при расположении команд в порядке убывания их «игровой силы» (а таких расположений всего два) может быть как на первом, так и на последнем месте!

-   [Saari (2008)](Saari_%282008%29.ipynb)

    Простой пример, приводимый в кратком анонсе четвёртой главы книги [D.G.Saari](https://doi.org/10.1017/CBO9780511754265.005), интересен тем, как сумма наддиагональных элементов «облегчённой» матрицы потерь ведёт себя вблизи минимума.
    «Оптимальная» перестановка в примере (дающая минимальный уровень суммы) единственна, а на «предоптимальном» уровне имеются две отдельные области, получаемые сразу после сортировки количеств отрицательных значений в столбцах и строках, но состоящие только из одной перестановки каждая.

-   [Двоенко, Пшеничный (2015)](Dvoenko_%282015%29.ipynb)

    Для указанных в статье восьми ранжирований имеется 160 оптимальных итоговых ранжирований 14 рассматриваемых альтернатив. Предложенное там итоговое ранжирование не является медианой Кемени; способ его получения неизвестен.

## Тестирование функции `consensus()` из пакета `Rankings.jl`

