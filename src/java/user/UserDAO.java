/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import database.DBConfiguration;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jevison7x
 */
public class UserDAO
{

    public static String InvoiceCheck() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        String sql = "SELECT  invoice_data FROM invoices WHERE id=(SELECT MAX(id) FROM invoices)";
        // int quantity = 220; // %08 means total length of number would be 8
        // if number is of 3 digits, rest of them will // be padded by leading zeros.
        //String padded = String.format("%08d", quantity);

        int vl;

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection())
        {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int num;

            if(rs.next())
            {
                String sn = rs.getString("invoice_data");
                num = Integer.parseInt(sn, 10);
                vl = num + 1;
                String padded = String.format("%07d", vl);

                return padded;

            }
            else
                return "0000001";

        }
    }

    public static Boolean PostedInvoices(InvoiceObj invoice) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        String sql = "INSERT INTO invoices ("
                + "invoice_data, "
                + "eastern_teritory, "
                + "vendor_mgr, "
                + "from_tb, "
                + "to_tb, "
                + "account_code, "
                + "plant_code, "
                + "dn_number, "
                + "date, "
                + "product, "
                + "qty, "
                + "unit_amount, "
                + "total_amount"
                + ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection())
        {

            String invoice_no = invoice.getInvoice_n();
            String eastern_teritory = invoice.getEastern_teritory();
            String vendor_mgr = invoice.getVendor_mgr();
            String frompicker = invoice.getFrompicker();
            String topicker = invoice.getTopicker();
            String acct_code = invoice.getAcct_code();
            String plant_code = invoice.getPlant_code();
            String dnNum = invoice.getDnNum();
            String daten = invoice.getDaten();
            String prod_name = invoice.getProd_name();
            Double r_qty = invoice.getR_qty();
            Double u_cost = invoice.getU_cost();
            Double t_cost = invoice.getT_cost();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, invoice_no);
            pst.setString(2, eastern_teritory);
            pst.setString(3, vendor_mgr);
            pst.setString(4, frompicker);
            pst.setString(5, topicker);
            pst.setString(6, acct_code);
            pst.setString(7, plant_code);
            pst.setString(8, dnNum);
            pst.setString(9, daten);
            pst.setString(10, prod_name);
            pst.setDouble(11, r_qty);
            pst.setDouble(12, u_cost);
            pst.setDouble(13, t_cost);

            int row = pst.executeUpdate();
            if(row == 1)
                return row == 1;
            else
                return false;

        }
    }

    public static List<InvoiceObj> getAllInvoices() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT * FROM invoices ORDER BY date ASC";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<InvoiceObj> allInvoiceRecs = new ArrayList<>();
            while(rs.next())
                allInvoiceRecs.add(getAllInvoices(rs));
            return allInvoiceRecs;
        }

    }

    private static InvoiceObj getAllInvoices(ResultSet rs) throws SQLException
    {
        InvoiceObj inObj = new InvoiceObj();
        inObj.setInvoice_n(rs.getString("invoice_data"));
        inObj.setEastern_teritory(rs.getString("eastern_teritory"));
        inObj.setVendor_mgr(rs.getString("vendor_mgr"));
        inObj.setFrompicker(rs.getString("from_tb"));
        inObj.setTopicker(rs.getString("to_tb"));
        inObj.setAcct_code(rs.getString("account_code"));
        inObj.setPlant_code(rs.getString("plant_code"));
        inObj.setDnNum(rs.getString("dn_number"));
        inObj.setDaten(rs.getString("date"));
        inObj.setProd_name(rs.getString("product"));
        inObj.setR_qty(rs.getDouble("qty"));
        inObj.setU_cost(rs.getDouble("unit_amount"));
        inObj.setT_cost(rs.getDouble("total_amount"));
        inObj.setId(rs.getInt("id"));

        return inObj;
    }

    public static List<InvoiceObj> getAllInvoices2(String dnNum, String invoice_n, String daten, String prod_name,
            String r_qty, String u_cost, String t_cost, String eastern_teritory, String vendor_mgr, String frompicker,
            String topicker, String acct_code, String plant_code) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT * FROM invoices"
                    + " WHERE dn_number LIKE '" + dnNum + "%' AND invoice_data LIKE '" + invoice_n + "%' AND date LIKE '" + daten + "%' AND product LIKE '" + prod_name + "%'"
                    + " AND qty LIKE '" + r_qty + "%' AND unit_amount LIKE '" + u_cost + "%' AND total_amount LIKE '" + t_cost + "%' AND eastern_teritory LIKE '" + eastern_teritory + "%'"
                    + " AND vendor_mgr LIKE '" + vendor_mgr + "%' AND from_tb LIKE '" + frompicker + "%' AND  to_tb LIKE '" + topicker + "%' AND account_code LIKE '" + acct_code + "%'"
                    + " AND plant_code LIKE '" + plant_code + "%' ";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<InvoiceObj> allInvoices = new ArrayList<>();
            while(rs.next())
                allInvoices.add(getInvoices2(rs));
            return allInvoices;
        }

    }

    private static InvoiceObj getInvoices2(ResultSet rs) throws SQLException
    {
        InvoiceObj inObj = new InvoiceObj();
        inObj.setInvoice_n(rs.getString("invoice_data"));
        inObj.setEastern_teritory(rs.getString("eastern_teritory"));
        inObj.setVendor_mgr(rs.getString("vendor_mgr"));
        inObj.setFrompicker(rs.getString("from_tb"));
        inObj.setTopicker(rs.getString("to_tb"));
        inObj.setAcct_code(rs.getString("account_code"));
        inObj.setPlant_code(rs.getString("plant_code"));
        inObj.setDnNum(rs.getString("dn_number"));
        inObj.setDaten(rs.getString("date"));
        inObj.setProd_name(rs.getString("product"));
        inObj.setR_qty(rs.getDouble("qty"));
        inObj.setU_cost(rs.getDouble("unit_amount"));
        inObj.setT_cost(rs.getDouble("total_amount"));
        inObj.setId(rs.getInt("id"));

        return inObj;

    }

    public static List<InvoiceObj> getSpecificInvoices(String invoice) throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {

        DBConfiguration dbConfig = new DBConfiguration();
        try(Connection conn = dbConfig.getDatabaseConnection();)
        {
            String sql = "SELECT * FROM invoices WHERE invoice_data='" + invoice + "' ORDER BY date ASC ";

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<InvoiceObj> allInvoiceRecs = new ArrayList<>();
            while(rs.next())
                allInvoiceRecs.add(getAllInvoices(rs));
            return allInvoiceRecs;
        }

    }

}
