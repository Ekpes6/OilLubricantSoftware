/*
 * Copyright (c) 2018, Xyneex Technologies. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * You are not meant to edit or modify this source code unless you are
 * authorized to do so.
 *
 * Please contact Xyneex Technologies, #1 Orok Orok Street, Calabar, Nigeria.
 * or visit www.xyneex.com if you need additional information or have any
 * questions.
 */
package util;

import database.DBConfiguration;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jevison7x
 * @since Aug 18, 2018 3:52:12 AM
 */
public class UtilityException extends RuntimeException
{

    private String servletContextName;

    private String requestedURI;

    public UtilityException()
    {
    }

    public UtilityException(Throwable cause)
    {
        super(cause);
        this.serializeException();
    }

    public UtilityException(Throwable cause, HttpServletRequest request)
    {
        super(cause);
        HttpSession session = request.getSession(false);
        this.requestedURI = request.getRequestURI();
        this.servletContextName = request.getServletContext().getServletContextName();

        this.serializeException();
    }

    private void serializeException()
    {
        if(!(this.getCause() instanceof UtilityException))
        {
            Calendar cal = DateTimeUtility.getTodayTimeZone();
            Timestamp timestamp = new Timestamp(cal.getTime().getTime());
            DBConfiguration dbConfig = new DBConfiguration();
            try(Connection conn = dbConfig.getDatabaseConnection())
            {
                String sql = "INSERT INTO exception_logs "
                        + "("
                        + "exception, "
                        + "user_err, "
                        + "message, "
                        + "servletContextName, "
                        + "requestedURI, "
                        + "dateCreated,"
                        + "staus"
                        + ") VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = conn.prepareStatement(sql);

                pst.setString(3, this.getCause().getMessage());
                pst.setString(4, this.servletContextName);
                pst.setString(5, this.requestedURI);
                pst.setTimestamp(6, timestamp, cal);
                pst.setString(7, "Unresolved");
                pst.executeUpdate();
            }
            catch(Exception xcp)
            {
            }
        }
    }

    public String getServletContextName()
    {
        return servletContextName;
    }

    public void setServletContextName(String servletContextName)
    {
        this.servletContextName = servletContextName;
    }

    public String getRequestedURI()
    {
        return requestedURI;
    }

    public void setRequestedURI(String requestedURI)
    {
        this.requestedURI = requestedURI;
    }
}
