using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Setting : System.Web.UI.Page
{
    static int cateid;
    static int brandid;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
{

}
    protected void add_Click(object sender, EventArgs e)
    {
        int i;
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from category where category_name='" + categoryname .Text + "' ";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        da.Fill(dt);

        i = Convert.ToInt32(dt.Rows.Count.ToString());
        con.Close();
        if (i > 0)
        {
            Response.Write("<script>alert('category name exit')</script>");
        }

        else
        {
            cati();
        }
    }
    protected void cati()
{
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into Category" + "(category_name) values(@category_name)", con);
        cmd.Parameters.AddWithValue("@category_name", categoryname.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect(Request.Url.AbsoluteUri);
        categoryname.Text = "";
    
    }
    protected void delete_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("update Category set  category_name='"+Textbox3.Text +"' where category_id='"+cateid+"'", con);
        cmd.ExecuteNonQuery();
        Response.Redirect(Request.Url.AbsoluteUri);
        con.Close();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int i;
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from brands where brand_name='" + brand_name.Text+ "' and category_id='"+categoryid .Text+"'";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        da.Fill(dt);

        i = Convert.ToInt32(dt.Rows.Count.ToString());
        con.Close();
          if (i > 0)
        {
            Response.Write("<script>alert('Brands name exit')</script>");
        }

        else
          {
              addi();
        }
        
    }
    protected void addi()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into brands" + "(brand_name,category_id) values(@brand_name,@category_id)", con);
        cmd.Parameters.AddWithValue("@brand_name",brand_name .Text );
        cmd.Parameters.AddWithValue("@category_id",categoryid .Text );
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect(Request.Url.AbsoluteUri);
        categoryname.Text = "";
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("update  brands set brand_name='"+ Textbox1 .Text +"'  where id='"+brandid+"' ", con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect(Request.Url.AbsoluteUri);
    }
    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
   
protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
{
  Textbox3 .Text =  DropDownList1.SelectedItem.Text ;
  cateid = int.Parse(DropDownList1.SelectedItem.Value);
}
protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
{
    categoryid.Text = DropDownList2.SelectedItem.Value;
}
protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
{
    Textbox1.Text = DropDownList4.SelectedItem.Text;
    brandid = int.Parse(DropDownList4.SelectedItem.Value);
}
}
