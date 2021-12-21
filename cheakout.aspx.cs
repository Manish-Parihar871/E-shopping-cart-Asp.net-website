using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class cheakout : System.Web.UI.Page
{
    int amounttotal;
    string totalof;
    string product_category_id;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
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
            total();
            historyupdate();
            address();
        }
    }
    protected void address()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM user_data where id='" + Session["user_id"] + "'  ", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater2.DataSource = dt;
        Repeater2.DataBind();
        con.Close();
    }
    protected void total()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT total from cart   ", con);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            totalof = dt.Rows[i]["total"].ToString();
            //b = Convert.ToInt32(Label3.Text);

            amounttotal = amounttotal + Convert.ToInt32(totalof);

            con.Close();
        }
      
        Label3.Text = amounttotal.ToString();
        Label7.Text = amounttotal.ToString(); ;
    }
    protected void historyupdate()
    {
    }
    protected void cheaKout_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("delete cart", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Close();
        Response.Redirect ("cart.aspx");
    }
}