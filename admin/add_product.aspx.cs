using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_add_product : System.Web.UI.Page
{
    string a;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

     int c ;
    protected void Page_Load(object sender, EventArgs e)
   
        {
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM  Category", con);
                SqlDataReader sr = cmd.ExecuteReader();
                if (categoriesDrop.Items.Count == 0)
                {

                    categoriesDrop.Items.Insert(0, new ListItem("Select Category", "0"));
                    for (int i = 1; sr.Read(); i++)
                    {

                        categoriesDrop.Items.Insert(i, new ListItem(sr["category_name"].ToString(), sr["category_id"].ToString()));
                    }
                }
                con.Close();
            }
       
    }

    protected void addproduct_Click(object sender, EventArgs e)
        
    {
        if (brandid.Text != "" && categoryid.Text != "" && product_name.Text != "" && product_price.Text != "" && product_desc.Text != "" && product_link.Text != "" && !FileUpload1.HasFile )
        {

            FileUpload1.SaveAs(Request.PhysicalApplicationPath + "./admin/image/" + FileUpload1.FileName.ToString());
            a = "/admin/image/"+ FileUpload1.FileName.ToString();
              con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into add_product (product_category_id,product_brand_id,product_name,product_price,product_image,product_dec,product_link) values(@product_category_id,@product_brand_id,@product_name,@product_price,@product_image,@product_dec,@product_link)";
            cmd.Parameters.AddWithValue("@product_category_id", categoryid.Text);
            cmd.Parameters.AddWithValue("@product_brand_id", brandid.Text);
            cmd.Parameters.AddWithValue("@product_name", product_name.Text);
            cmd.Parameters.AddWithValue("@product_price", product_price.Text);
            cmd.Parameters.AddWithValue("@product_image", a  );
            cmd.Parameters.AddWithValue("@product_dec", product_desc.Text);
            cmd.Parameters.AddWithValue("@product_link", product_link.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Add successfully')", true);
         
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please insert all box value')", true);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        branddrop.Items.Clear();

        c = int.Parse(categoriesDrop.SelectedValue);

        categoryid.Text = c.ToString();
      
            con.Open();
           SqlCommand cmd = new SqlCommand("SELECT * FROM brands where category_id='" + c + "'", con);
            if (branddrop.Items.Count == 0)
            {
                SqlDataReader sr = cmd.ExecuteReader();

                branddrop.Items.Insert(0, new ListItem("Select brands", "0"));
                for (int i = 1; sr.Read(); i++)
                {

                    branddrop.Items.Insert(i, new ListItem(sr["brand_name"].ToString(), sr["id"].ToString()));
                }
            }
            con.Close();

           
       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
       
       
            int a;
            a = Convert.ToInt32(branddrop.SelectedValue);

           
                brandid.Text = a.ToString();
           
           
    }
    protected void categoriesDrop_SelectedIndexChanged(object sender, EventArgs e)
    {
        

        branddrop.Items.Clear();

        c = int.Parse(categoriesDrop.SelectedValue);

        categoryid.Text = c.ToString();

        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM brands where category_id='" + c + "'", con);
 

        if (branddrop.Items.Count == 0)
        {
            SqlDataReader sr = cmd.ExecuteReader();

            branddrop.Items.Insert(0, new ListItem("Select brands", "0"));
            for (int i = 1; sr.Read(); i++)
            {

                branddrop.Items.Insert(i, new ListItem(sr["brand_name"].ToString(), sr["id"].ToString()));
            }
        }
        con.Close();

    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
}