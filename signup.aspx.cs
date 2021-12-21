using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class signup : System.Web.UI.Page
{
    string product_category_id;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            category();
        }
        if (!string.IsNullOrEmpty(Request.QueryString["categoryid"]))
        {
            product_category_id = Request.QueryString["categoryid"];

        }
    }
    protected void Button_Click(object sender, EventArgs e)
    {
        if (signupname.Text != "" && signupemail.Text != "" && signupmobileno.Text != "" && signuppassword.Text != "" && address.Text != "")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into user_data" + "(user_name,email_id,mobile_no,password,address,admin) values(@user_name,@email_id,@mobile_no,@password,@address,@admin)", con);
            cmd.Parameters.AddWithValue("@user_name", signupname.Text);
            cmd.Parameters.AddWithValue("@email_id", signupemail.Text);
            cmd.Parameters.AddWithValue("@mobile_no", signupmobileno.Text);
            cmd.Parameters.AddWithValue("@password", signuppassword.Text);
            cmd.Parameters.AddWithValue("@address", address.Text);
            cmd.Parameters.AddWithValue("@admin", "no");
            cmd.ExecuteNonQuery();
            Response.Write("connected");
            con.Close();
            signupname.Text = "";
            signupemail.Text = "";
            signupmobileno.Text = "";
            signuppassword.Text = "";
            address.Text = "";

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account createdsuccessfully')", true);
            Response.Redirect("login.aspx");
        }
        else
        {
            l1.Text = "Please insert all box values";
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
  
}