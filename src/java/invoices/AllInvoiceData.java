/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package invoices;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.InvoiceObj;
import user.UserDAO;
import util.UtilityException;

/**
 *
 * @author EKPES
 */
public class AllInvoiceData extends HttpServlet
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try
        {
            response.setContentType("application/json");
            // String sSearch = request.getParameter("search[value]");
            int colIndex = Integer.parseInt(request.getParameter("order[0][column]"));
            int length = Integer.parseInt(request.getParameter("length"));
            int start = Integer.parseInt(request.getParameter("start"));
            int echo = Integer.parseInt(request.getParameter("draw"));
            String colDir = request.getParameter("order[0][dir]");
            List nuArr = new ArrayList();
            for(int i = 0; i < 13; i++)
            {
                String sSearch = request.getParameter("columns[" + i + "][search][value]");
                nuArr.add(sSearch);
            }
            String dnNum = (String)nuArr.get(0);
            String invoice_n = (String)nuArr.get(1);
            String daten = (String)nuArr.get(2);
            String prod_name = (String)nuArr.get(3);
            String r_qty = (String)nuArr.get(4);
            String u_cost = (String)nuArr.get(5);
            String t_cost = (String)nuArr.get(6);
            String eastern_teritory = (String)nuArr.get(7);
            String vendor_mgr = (String)nuArr.get(8);
            String frompicker = (String)nuArr.get(9);
            String topicker = (String)nuArr.get(10);
            String acct_code = (String)nuArr.get(11);
            String plant_code = (String)nuArr.get(12);

            int iTotalRecords = UserDAO.getAllInvoices().size();

            List<InvoiceObj> allinObj = UserDAO.getAllInvoices2(dnNum, invoice_n, daten, prod_name, r_qty,
                    u_cost, t_cost, eastern_teritory, vendor_mgr, frompicker, topicker, acct_code, plant_code);
            int iTotalDisplayRecords = allinObj.size();// number of sales that match search criterion should be returned
            final int sortColumnIndex = colIndex;
            final int sortDirection = colDir.equals("asc") ? -1 : 1;

            Collections.sort(allinObj, (InvoiceObj t, InvoiceObj t1)
                    ->
            {
                switch(sortColumnIndex)
                {
                    case 0:
                        return t.getDaten().compareTo(t1.getDaten()) * sortDirection;
                    case 1:
                        return t.getProd_name().compareTo(t1.getProd_name()) * sortDirection;
                    case 2:
                        return t.getEastern_teritory().compareTo(t1.getEastern_teritory()) * sortDirection;
                    case 3:
                        return t.getVendor_mgr().compareTo(t1.getVendor_mgr()) * sortDirection;

                }
                return 0; //To change body of generated methods, choose Tools | Templates.
            });

            if(allinObj.size() < start + length)
                allinObj = allinObj.subList(start, allinObj.size());
            else
                allinObj = allinObj.subList(start, start + length);

            try
            {
                JsonObject jsonResponse = new JsonObject();
                jsonResponse.addProperty("sEcho", echo);
                jsonResponse.addProperty("iTotalRecords", iTotalRecords);
                jsonResponse.addProperty("iTotalDisplayRecords", iTotalDisplayRecords);
                Gson gson = new GsonBuilder().setPrettyPrinting().create();

                jsonResponse.add("aaData", gson.toJsonTree(allinObj));

                response.setContentType("application/Json");
                response.getWriter().print(jsonResponse.toString());

            }
            catch(JsonIOException e)
            {
                response.setContentType("text/html");
                response.getWriter().print(e.getMessage());
            }

        }
        catch(SQLException | IOException | IllegalArgumentException | ClassNotFoundException xcp)
        {
            throw new UtilityException(xcp, request);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
