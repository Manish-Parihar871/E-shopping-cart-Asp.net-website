using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class compare : System.Web.UI.Page
{
    static string productname;
    SqlCommand cmd = new SqlCommand();
    string categary;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

        string id = Request.QueryString["id"];
        Label6.Text = id;
       
        productname = Request.QueryString["pname"];

        categary = Request.QueryString["category"];
        Label13.Text = categary;
       
        if (!this.IsPostBack)
        {
            this.BindRepeater();
           
        }

    }
    private void BindRepeater()
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=F:\bca project\shop\App_Data\admin_database.mdf;Integrated Security=True");

        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product  where product_id='" + Label6.Text + "' and product_category_id='" + categary + "'", con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        d2.DataSource = dt;
        d2.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int cat = Convert.ToInt32 (Label13.Text);

        if (TextBox1.Text !=productname  )
        {
            Label12.Text = "";
          
            SqlCommand cmd = new SqlCommand("SELECT * FROM add_product  where product_name='" + TextBox1.Text + "' and product_category_id='"+cat+"'", con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            d1.DataSource = dt;
            d1.DataBind();

        }

        else
        {
            Label12.Text = "do not selected some product";
        }

    }
   
    
}