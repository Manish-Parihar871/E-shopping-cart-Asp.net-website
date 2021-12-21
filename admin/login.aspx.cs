using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_Click(object sender, EventArgs e)
    {
        int i;
        string a,admin;
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from user_data where email_id='" + loginemail.Text + "' and password ='" + loginpassword.Text + "'";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        da.Fill(dt);

        i = Convert.ToInt32(dt.Rows.Count.ToString());

        if (i == 1)
        {

            a = dt.Rows[0][0].ToString();
            Session["auser_id"] = a;
            admin = dt.Rows[0][6].ToString();
            if (admin == "yes")
            {
               
                Session["auser_id"] = a;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid ID and Password')", true);
     
            }
           
        }
        //else
        //{
        //    Response.Write("username and password invalid");
        //}

        con.Close();

    }
    protected void Button1_Click (object sender, EventArgs e)
    {
        Response.Redirect("forgetpass.aspx");
    }
}