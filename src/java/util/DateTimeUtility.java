/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author Jevison7x
 */
public class DateTimeUtility
{
    public static long daysBetween(Calendar startDate, Calendar endDate)
    {
        long end = endDate.getTimeInMillis();
        long start = startDate.getTimeInMillis();
        return TimeUnit.MILLISECONDS.toDays(Math.abs(end - start));
    }

    public static GregorianCalendar getTodayTimeZone()
    {
        //SimpleTimeZone timeZone = new SimpleTimeZone(1, "Africa/Lagos");
        GregorianCalendar todayCal = new GregorianCalendar(TimeZone.getTimeZone("Africa/Lagos"));
        return todayCal;
    }
}
