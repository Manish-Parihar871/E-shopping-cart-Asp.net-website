using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class product_details : System.Web.UI.Page
{
    string cartid;
    string usersname;
    string product_category_id;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            category();
        }
       
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string product_id = Request.QueryString["id"];
                Label1.Text = product_id;
                details();
                show();
                cart();
            }
            if (!string.IsNullOrEmpty(Request.QueryString["categoryid"]))
            {
                product_category_id = Request.QueryString["categoryid"];
                
            }
           
       
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect(Label5 .Text);
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        
        string message1 = Label1.Text;
        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where product_id='" + message1  + "' ", con);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        da.Fill(dt);
        string cat = dt.Rows[0]["product_category_id"].ToString();
        con.Close();
       
        string message2 = cat ;
        string message3 = Label2.Text;

        Response.Redirect("compare.aspx?id=" + message1 + "&category=" + message2 +"&pname="+message3 );
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
    
    protected void details()
    {
       
        SqlCommand cmd = new SqlCommand("SELECT * FROM add_product where product_id='"+Label1 .Text +"' ", con);

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        da.Fill(dt);
        Image1 .ImageUrl = dt.Rows[0][4].ToString ();
        Label2 .Text =dt.Rows [0][1].ToString ();
        Label3.Text = dt.Rows[0][3].ToString();
        Label4.Text = dt.Rows[0][2].ToString();
        Label5.Text = dt.Rows[0][6].ToString();
        //Label3.Text = ds.Tables[0].Rows.Count.ToString();
        con.Close();
        // dt.Rows[0][6].ToString()
    }
    protected void cart()
    {
        con.Open();
        
        SqlCommand cmd = new SqlCommand("SELECT * FROM cart where product_id ='"+Label1 .Text +"' ", con);

        DataTable dt = new DataTable();
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            cartid= dr["product_id"].ToString ();

           // Response.Write(cartid );
        }
       
        con.Close();    
    }
    protected void reviewsubmit_Click(object sender, EventArgs e)
    {
        username();
        if (TextBox1.Text != null)
            con.Open();
        SqlCommand cmd = new SqlCommand("insert into comments" + "(name,time,text,product_id,user_id)values(@name,@time,@text,@product_id,@user_id)", con);
        cmd.Parameters.AddWithValue("@name", usersname );
        cmd.Parameters.AddWithValue("@time", DateTime.Now);
        cmd.Parameters.AddWithValue("@text", TextBox1.Text);
        cmd.Parameters.AddWithValue("@product_id", Label1.Text);
        cmd.Parameters .AddWithValue ("@user_id",Session ["user_id"].ToString ());


        cmd.ExecuteNonQuery();
        TextBox1.Text = "";
        Response.Redirect(Request.Url.AbsoluteUri);
        con.Close();
    }
    protected void username()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM user_data where Id='" + Session ["user_id"].ToString() + "' ", con);
        DataTable dt = new DataTable();
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            usersname = dr["user_name"].ToString ();
        }
        con.Close();
        Response.Write(usersname );
    }
    protected void show()
    {
       
        
         con.Open();
         SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select name,time,text from comments where product_id= '" + Label1.Text + "' order by time desc";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds, "comments");
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
        con.Close();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
       Response.Write("cartid="+cartid +"label1="+Label1 .Text );
           if (Label1.Text == cartid )
            {

                //Int32 a = Convert.ToInt32(Label3.Text) * Convert.ToInt32(TextBox2.Text);
               
                con.Open();
                SqlCommand cmd = new SqlCommand("update cart set product_qty='" + TextBox2.Text + "' where product_id='" + Label1.Text + "'", con);

                cmd.Parameters.AddWithValue("@product_qty", TextBox2.Text);

                cmd.ExecuteNonQuery();
                con.Close();

            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into cart" + "(product_id,product_name,product_image,product_price,product_qty,total,datetime,user_id,status)values(@product_id,@product_name,@product_image,@product_price,@product_qty,@total,@datetime,@user_id,@status)", con);
                cmd.Parameters.AddWithValue("@product_id", Label1.Text);
                cmd.Parameters.AddWithValue("@product_name", Label2.Text);
                cmd.Parameters.AddWithValue("@product_image", Image1.ImageUrl);
                cmd.Parameters.AddWithValue("@product_price", Label3.Text);
                cmd.Parameters.AddWithValue("@product_qty", TextBox2.Text);
                int total = int.Parse(Label3.Text) * int.Parse(TextBox2.Text);
                cmd.Parameters.AddWithValue("@total", total);
                cmd.Parameters.AddWithValue("@datetime",DateTime .Now);
                cmd.Parameters.AddWithValue("@user_id",Session ["user_id"].ToString());
                cmd.Parameters.AddWithValue("@status", "pending");
                cmd.ExecuteNonQuery();
                con.Close();
}
        
        
        //Response.Redirect(Request.Url.AbsoluteUri);
    }
}