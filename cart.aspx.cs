using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class cart : System.Web.UI.Page
{
     int amounttotal;
    string totalof;
    string product_category_id;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM cart  ", con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            con.Close();
            category();
            total();
        }
        if (!string.IsNullOrEmpty(Request.QueryString["categoryid"]))
        {
            product_category_id = Request.QueryString["categoryid"];

        }
        }
    protected void total()
    {
        
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT total from cart  ", con);
        DataTable dt = new DataTable();
          SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        for(int i=0; i<dt.Rows.Count ;i++){
            
      totalof  = dt.Rows[i]["total"].ToString() ;
     //b = Convert.ToInt32(Label3.Text);

      amounttotal  = amounttotal  + Convert .ToInt32 (totalof );
         
        con.Close();
      }
     
        Label3.Text = amounttotal.ToString ();
        Label7.Text = amounttotal.ToString(); ;
    }
    protected void delete_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
        string message = "" + (item.FindControl("Label6") as Label).Text;
        //Response.Redirect("cart.aspx?id=" + message);
       
        con.Open();
        SqlCommand cmd = new SqlCommand("delete cart where Id='" + message + "' ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        Response.Redirect(Request.Url.AbsoluteUri);
        con.Close();
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


    protected void addressupdate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("update user_data set user_name='"+TextBox1 .Text+"',address='"+TextBox2 .Text +"' where ID='"+Session["user_id"]+"'", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Close();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Update successfully')", true);
     
    }
    
    protected void cheaKout_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into order_history(product_id,product_name,product_image,product_price,product_qty,total,user_id,datetime,status) select product_id,product_name,product_image,product_price,product_qty,total,user_id,datetime,status from cart ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Close();
        delete();
       // Response.Redirect(Request.Url.AbsoluteUri);
        Response.Redirect ("cheakout.aspx");
    }
   
    protected void delete()
    {
      
    }
}   
