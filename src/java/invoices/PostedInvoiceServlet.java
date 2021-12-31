/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package invoices;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class PostedInvoiceServlet extends HttpServlet
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
        response.setContentType("application/json");
        try
        {

            InvoiceObj invoice = new InvoiceObj();

            invoice.setInvoice_n(request.getParameter("invoice_n").trim());
            invoice.setAcct_code(request.getParameter("acct_code"));
            invoice.setEastern_teritory(request.getParameter("eastern_teritory"));
            invoice.setPlant_code(request.getParameter("plant_code"));
            invoice.setVendor_mgr(request.getParameter("vendor_mgr"));
            invoice.setDaten(request.getParameter("daten").trim());

            invoice.setDnNum(request.getParameter("dnNum"));
            invoice.setFrompicker(request.getParameter("frompicker").trim());
            invoice.setTopicker(request.getParameter("topicker").trim());
            invoice.setR_qty(Double.parseDouble(request.getParameter("r_qty")));

            invoice.setProd_name(request.getParameter("prod_name").trim());

            if("".equals(request.getParameter("u_cost")))
                invoice.setU_cost(0.00);
            else
                invoice.setU_cost(Double.parseDouble(request.getParameter("u_cost")));
            if("".equals(request.getParameter("t_cost")))
                invoice.setT_cost(0.00);
            else
                invoice.setT_cost(Double.parseDouble(request.getParameter("t_cost")));

            Boolean conpay = UserDAO.PostedInvoices(invoice);
            if(conpay)
            {
                Gson gson = new GsonBuilder().setPrettyPrinting().create();
                String json = gson.toJson("The invoice slip was posted successful");
                try(PrintWriter out = response.getWriter())
                {
                    out.print(json);
                }
            }
            else
            {
                Gson gson = new GsonBuilder().setPrettyPrinting().create();
                String json = gson.toJson("The invoice slip was not successful");
                try(PrintWriter out = response.getWriter())
                {
                    out.print(json);
                }

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
