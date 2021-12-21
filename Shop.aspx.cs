using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Shop : System.Web.UI.Page
{
    string product_category_id;
    string message;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["categoryid"]))
        {
            product_category_id = Request.QueryString["categoryid"];
        }
        if (!this.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where product_category_id='" + product_category_id + "'", con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            category();
            brands();
           
        }

       
    }
    protected void category()
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM Category ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater3.DataSource = dt;
        Repeater3.DataBind();
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        string message1 = "" + (item.FindControl("Button10") as Button).Text;
         SqlCommand cmd = new SqlCommand("SELECT * FROM Category where category_name='" + message1 + "' ", con);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        da.Fill(dt);
        Label6.Text = dt.Rows[0][0].ToString();
        con.Close();
        Response.Redirect("Shop.aspx?categoryid=" + Label6.Text);

    }
    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("index.aspx");
    }
    protected void shop_Click(object sender, EventArgs e)
    {
        Response.Redirect("Mobiles.aspx");
    }
    protected void Serchbutton_Click(object sender, EventArgs e)
    {
        int i;
        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where product_name='" + Serch.Text + "' ", con);

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
    protected void buy_Click(object sender, EventArgs e)
    {

        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        string message = "" + (item.FindControl("Label3") as Label).Text;
        Response.Redirect("product_details.aspx?id=" + message);

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
         message = "" + (item.FindControl("Button3") as Button ).Text;
        brandid();
       

        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where product_brand_id='" +Label3 .Text +"' and product_category_id='" + product_category_id + "'", con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
           
    }
    protected void brandid()
    {
        
         SqlCommand cmd = new SqlCommand("SELECT * FROM brands where brand_name='"+message +"' ", con);

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        da.Fill(dt);
        Label3 .Text =dt.Rows [0][0].ToString ();
        con.Close();
    }
    protected void brands()
    {
        

        SqlCommand cmd = new SqlCommand("SELECT * FROM brands where category_id='" + product_category_id + "'", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater2.DataSource = dt;
        Repeater2.DataBind();
      
    }

  
    protected void Button1_Click(object sender, EventArgs e)
    {
      
        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where  product_category_id ='"+product_category_id +"' and product_price > 0  and product_price <=1000 ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where product_category_id ='" + product_category_id + "' and product_price >1000  and product_price <=10000 ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        
        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where  product_category_id ='" + product_category_id + "' and product_price >10000  and product_price <=20000 ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
      
        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where product_category_id ='" + product_category_id + "' and product_price >20000  and product_price <=50000 ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
         SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where  product_category_id ='" + product_category_id + "' and product_price >50000 ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
    }
}
