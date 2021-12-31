/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

/**
 *
 * @author EKPES
 */
public class InvoiceObj
{
    private int id;
    private Double r_qty;
    private String invoice_n;
    private String acct_code;
    private String eastern_teritory;
    private String plant_code;
    private String vendor_mgr;
    private Double u_cost;
    private Double t_cost;
    private String prod_name;
    private String daten;
    private String dnNum;
    private String frompicker;
    private String topicker;

    public InvoiceObj()
    {
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public Double getR_qty()
    {
        return r_qty;
    }

    public void setR_qty(Double r_qty)
    {
        this.r_qty = r_qty;
    }

    public String getInvoice_n()
    {
        return invoice_n;
    }

    public void setInvoice_n(String invoice_n)
    {
        this.invoice_n = invoice_n;
    }

    public String getAcct_code()
    {
        return acct_code;
    }

    public void setAcct_code(String acct_code)
    {
        this.acct_code = acct_code;
    }

    public String getEastern_teritory()
    {
        return eastern_teritory;
    }

    public void setEastern_teritory(String eastern_teritory)
    {
        this.eastern_teritory = eastern_teritory;
    }

    public String getPlant_code()
    {
        return plant_code;
    }

    public void setPlant_code(String plant_code)
    {
        this.plant_code = plant_code;
    }

    public String getVendor_mgr()
    {
        return vendor_mgr;
    }

    public void setVendor_mgr(String vendor_mgr)
    {
        this.vendor_mgr = vendor_mgr;
    }

    public Double getU_cost()
    {
        return u_cost;
    }

    public void setU_cost(Double u_cost)
    {
        this.u_cost = u_cost;
    }

    public Double getT_cost()
    {
        return t_cost;
    }

    public void setT_cost(Double t_cost)
    {
        this.t_cost = t_cost;
    }

    public String getProd_name()
    {
        return prod_name;
    }

    public void setProd_name(String prod_name)
    {
        this.prod_name = prod_name;
    }

    public String getDaten()
    {
        return daten;
    }

    public void setDaten(String daten)
    {
        this.daten = daten;
    }

    public String getDnNum()
    {
        return dnNum;
    }

    public void setDnNum(String dnNum)
    {
        this.dnNum = dnNum;
    }

    public String getFrompicker()
    {
        return frompicker;
    }

    public void setFrompicker(String frompicker)
    {
        this.frompicker = frompicker;
    }

    public String getTopicker()
    {
        return topicker;
    }

    public void setTopicker(String topicker)
    {
        this.topicker = topicker;
    }

}
