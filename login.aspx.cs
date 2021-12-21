using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    int i;
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
    { string a,admin;
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from user_data where email_id='" + loginemail.Text + "' and password ='" + loginpassword.Text + "'" ;
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        da.Fill(dt);

        i = Convert.ToInt32(dt.Rows.Count.ToString());

        if (i == 1)
        {
            //  if (dt.Rows[0][6].ToString() == "true")
            //  {
            //   
            //     Response.Redirect("/admin/Dashboard.aspx");
            a = dt.Rows[0][0].ToString();
            admin=dt.Rows[0][6].ToString();
            if (admin == "no")
            {
                Session["user_id"] = a;
                Response.Redirect("index.aspx");
            }
            else
            {
                Session["auser_id"] = a;
                Response.Redirect("/admin/Dashboard.aspx");
            }
            
        }
        else
        {
            msgerror.Text = "Invalid email-id and password";
        }
        //else
        //{
        //    Response.Write("username and password invalid");
        //}

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

    protected void Button_Click1(object sender, EventArgs e)
    {
        Response.Redirect("forgetpass.aspx");
    }
    protected void Button_Click2(object sender, EventArgs e)
    {
        Response.Redirect("signup.aspx");
    }
}