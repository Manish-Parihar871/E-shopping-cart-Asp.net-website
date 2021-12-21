using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Orderhistory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
 
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack )
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM  order_history where user_id='"+Session ["user_id"]+"' order by datetime desc", con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            con.Close();
        }
    }
}