using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Windows.Forms;

public partial class ADMIN_sub_teach : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("~/ADMIN/Admin_Login.aspx");
        }
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int incr;
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
        cn.Open();
        string sql = "select techid from techid where username = '" + txtuser.Text + "' AND major ='" + txtmajor.Text + "' AND subname ='" + txtsub.Text + "' AND topic ='" + txttopic.Text + "';";
        SqlCommand cmd = new SqlCommand(sql, cn);
        SqlDataReader reader = cmd.ExecuteReader();
        if(reader.Read())
        {
          
            tech_id.Text = reader[0].ToString();
            reader.Close();
        }
        else
        {
            reader.Close();
            string sql1 = "select MAX(techid) from techid;";
            SqlCommand cmd1 = new SqlCommand(sql1, cn);
            SqlDataReader reader1 = cmd1.ExecuteReader();
            if(reader1.Read())
            {
                
                incr =(int)reader1[0];
                incr++;
                reader1.Close();
                string sql2 = "insert into techid values('"+txtuser.Text+ "','"+txtmajor.Text+ "','"+txtsub.Text+ "','"+txttopic.Text+ "','"+incr+"');";
                SqlCommand cmd2 = new SqlCommand(sql2,cn);
                cmd2.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
                tech_id.Text = incr.ToString();

                
            }
            else
            {
                tech_id.Text = "error";
            }



        }
        cn.Close();
        }




}