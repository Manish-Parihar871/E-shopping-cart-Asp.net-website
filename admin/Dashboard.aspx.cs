using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Dashbord : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM  order_history,user_data where order_history.user_id=user_data.id and status='pending'  ", con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            con.Close();
        }
    }
    protected void delivered_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        string message = "" + (item.FindControl("Label6") as Label).Text;
        //Response.Redirect("cart.aspx?id=" + message);
        Response.Write(message);
        con.Open();
        SqlCommand cmd = new SqlCommand("update order_history set status='delivered' where id='" + message + "'", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Close();
        Response.Redirect(Request.Url.AbsoluteUri);
        
    }
     protected void cancel_Click(object sender, EventArgs e)
     {

         RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
         string message = "" + (item.FindControl("Label6") as Label).Text;
         //Response.Redirect("cart.aspx?id=" + message);
         Response.Write(message);
         con.Open();
         SqlCommand cmd = new SqlCommand("update order_history set status='cancel' where id='" + message + "'", con);
         SqlDataAdapter sda = new SqlDataAdapter(cmd);
         DataTable dt = new DataTable();
         sda.Fill(dt);
         con.Close();
         Response.Redirect(Request.Url.AbsoluteUri);
         
     }
     protected void Logout_Click(object sender, EventArgs e)
     {
         Session.Clear();
         Session.Abandon();
         Response.Redirect("login.aspx");
     }
    
}