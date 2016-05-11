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


public partial class ADMIN_ADMINChangePassword : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("~/ADMIN/Admin_Login.aspx");
        }
        else
        {
            txtUsername.Text = Session["uname"].ToString();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        cn.Open();
        string sql = "update tblAdmin_Login set password='" + txtnewPassword.Text + "' where username='" + txtUsername.Text + "' and password='" + txtPassword.Text + "'";
        SqlCommand cmd = new SqlCommand(sql, cn);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            lblError.Text = "UR PASSWORD HAS BEEN CAHNGED::pass::" + txtnewPassword.Text;

        }
        else
        {
            lblError.Text = "UR PASSWORD HAS BEEN INVALID";

        }
    }
    protected void btnReSet_Click(object sender, EventArgs e)
    {

        txtPassword.Text = "";
        txtnewPassword.Text = "";
        txtconfirmpass.Text = "";
    }
}