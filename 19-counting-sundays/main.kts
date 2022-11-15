/**
 * How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
 *
 *  for each day in the 20th century:
 *      if its a sunday and 1st in month:
 *          count it
 *
 */

fun main() {
    var count = 0
    for (day in daysInCentury()) {
        if (day.year.year == 1900)
            continue
        if (day.year.year == 2001)
            break
        if (day.weekday == 7 && day.day == 1)
            count++
    }
    println(count)
}

fun daysInCentury(): Sequence<Day> {
    var day = Day(1, 1, Month(1), Year(1900))
    return generateSequence(day) { it.nextDay }
}

data class Day(val weekday: Int, val day: Int, val month: Month, val year: Year) {
    val nextDay: Day
        get() {
            val weekday = (weekday % 7) + 1
            val day = (day % month.length(year)) + 1
            val month = if (day == 1) month.nextMonth else month
            val year = if (day == 1 && month == 1 as Any) year.nextYear else year
            return Day(weekday, day, month, year)
        }
}

data class Month(val month: Int) {
    fun length(year: Year): Int = when (month) {
        2 -> if (year.isLeap) 29 else 28
        4, 6, 9, 11 -> 30
        else -> 31
    }

    val nextMonth: Month
        get() = Month((month % 12) + 1)

    operator override fun equals(other: Any?): Boolean {
        if (other is Int)
            return month == other
        if (other is Month)
            return month == other.month
        return false
    }

    fun equals(other: Int): Boolean {
        return month == other
    }
}

data class Year(val year: Int) {

    val isLeap: Boolean
        get() = (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0))

    val nextYear: Year
        get() = Year(year + 1)
}

main()