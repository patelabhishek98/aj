using System;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class ADMIN_CreateAdmin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if(Session["uname"] == null)
        {
            
            Response.Redirect("~/ADMIN/Admin_Login.aspx");
        }
        else
        {
            string Admin = Session["uname"].ToString();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            string sql = "insert into tblAdmin_Login values('" + txtUsername.Text + "','" + txtPassword.Text + "')";
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView1.DataBind();
        }
        catch
        {
            lblError.Text = "Username Already Exist";
        }
    }

    protected void btnReSet_Click(object sender, EventArgs e)
    {
        txtUsername.Text = "";
        txtPassword.Text = "";
        txtConfirmPassword.Text = "";
        lblusername.Text = "";
        txtUsername.BorderStyle = BorderStyle.NotSet;
        txtUsername.BorderColor = System.Drawing.Color.Empty;
    }

    protected void txtUsername_TextChanged(object sender, EventArgs e)
    {
        cn.Open();
        string sq = "select * from tblAdmin_login where username='" + txtUsername.Text + "'";
        SqlCommand cm = new SqlCommand(sq, cn);
        SqlDataReader red = cm.ExecuteReader();
        if (red.Read() == true)
        {
            lblusername.Text = "user name is not available";
            txtUsername.BorderStyle = BorderStyle.Groove;
            txtUsername.BorderColor = System.Drawing.Color.Red;

        }
        else
        {
            lblusername.Text = "";
            txtUsername.BorderStyle = BorderStyle.Groove;
            txtUsername.BorderColor = System.Drawing.Color.Green;
        }
        cn.Close();
    }

    protected void txtConfirmPassword_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtPassword_TextChanged(object sender, EventArgs e)
    {

    }
}