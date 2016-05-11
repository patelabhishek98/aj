using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class ADMIN_Admin_Login : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        cn.Open();
        string sql = "select * from tbladmin_login where username='" + txtUsername.Text + "' and password='" + txtPassword.Text + "'";
        SqlCommand cmd = new SqlCommand(sql, cn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            Session["uname"] = txtUsername.Text.ToString();
             Response.Redirect("~/admin/ADMINIndex.aspx");  
            lblError.Text = "sex";
        }
        else
        {
            lblError.Text = "Username and pass not matched";
        }
        cn.Close();

    }

    protected void btnReSet_Click(object sender, EventArgs e)
    {
        //this code is for reset 
        txtUsername.Text = "";
        txtPassword.Text = "";
    }
}