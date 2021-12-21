using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class index : System.Web.UI.Page
{
     SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            
            SqlCommand cmd = new SqlCommand("SELECT * FROM add_product ", con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            category();
        }
    }
    protected void category()
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM Category ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater2.DataSource = dt;
        Repeater2.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        string message = "" + (item.FindControl("Button1") as Button).Text;
        
        SqlCommand cmd = new SqlCommand("SELECT * FROM Category where category_name='" + message + "' ", con);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        da.Fill(dt);
        Label6.Text = dt.Rows[0][0].ToString();
        con.Close();
        Response.Redirect("Shop.aspx?categoryid=" + Label6 .Text );

    }
    protected void Logout_Click (object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("index.aspx");
    }
    protected void shop_Click(object sender, EventArgs e)
    {
        Response.Redirect("Mobiles.aspx");
    }
    protected void buy_Click(object sender, EventArgs e)
    {

        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        string message = "" + (item.FindControl("Label3") as Label).Text;
        Response.Redirect("product_details.aspx?id=" + message);

    }
    //protected void compare_Click(object sender, EventArgs e)
    //{
    //    RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
    //    string message = (item.FindControl("Label3") as Label).Text;
    //    Response.Redirect("compare.aspx?id=" + message);

    //}
    protected void Serchbutton_Click (object sender, EventArgs e)
    {
        int i;
        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where product_name='"+Serch.Text +"' ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
         i = Convert.ToInt32(dt.Rows.Count.ToString());

         if (i == 1)
         {
             Repeater1.DataSource = dt;
             Repeater1.DataBind();
         }
         else
         {
             
         }
    }
   
}