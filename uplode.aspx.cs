using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;

public partial class ADMIN_uplode : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
    static string[] mediaExtensions = { ".PNG", ".JPG", ".JPEG", ".BMP", ".GIF", ".WAV", ".MID", ".MIDI", ".WMA", ".MP3", ".OGG", ".RMA", ".AVI", ".MP4", ".DIVX", ".WMV", ".flv", ".FLV" };

    static bool IsMediaFile(string path)
    {
        return mediaExtensions.Contains(Path.GetExtension(path), StringComparer.OrdinalIgnoreCase);
    }

    int Techid;
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex= 0;
        if (Session["uname"] == null)
        {
            Response.Redirect("~/ADMIN/Admin_Login.aspx");
        }
        else
        {
            txtuser.Text = Session["uname"].ToString();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        
        MultiView1.ActiveViewIndex = 1;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
          MultiView1.ActiveViewIndex = 2;
    }

    protected void Uplode_Click(object sender, EventArgs e)
    {
        if(FileUpload2.HasFile)
        {
            string filename = FileUpload2.FileName;
            

                cn.Open();
                string sql1 = "select * from techid where techid = " + txttechid.Text + ";";
                SqlCommand cmd1 = new SqlCommand(sql1, cn);
                SqlDataReader red = cmd1.ExecuteReader();
                if (red.Read())
                {
                     if (IsMediaFile(filename))
                     {
                        red.Close();
                        string sql = "insert into uplodev values('" + filename + "'," + txttechid.Text + ");";
                        SqlCommand cmd = new SqlCommand(sql, cn);
                         cmd.ExecuteNonQuery();
                         FileUpload2.SaveAs(Server.MapPath("~/ADMIN/uplode/" + filename));
                         Response.Write("<script>alert('uplode sucess');</script>");
                      }
                     else
                     {
                         Response.Write("<script>alert('file formate is different');</script>");
                     }
                }
                else
                {

                     Response.Write("<script>alert('techid allready available');</script>");
                     MultiView1.ActiveViewIndex = 0;
                     red.Close();
                 }
                    cn.Close();
        }
        else
        {
            Response.Write("<script>alert('please select your file');</script>");
        }
    }

    protected void uplode1_Click(object sender, EventArgs e)
    {
        if (FileUpload3.HasFile)
        {
            string file = FileUpload3.FileName;
            cn.Open();
            string sql2 = "select * from techid where techid = " + txttechid.Text + ";";
            SqlCommand cmd2 = new SqlCommand(sql2, cn);
            SqlDataReader red1 = cmd2.ExecuteReader();
            if (red1.Read())
            {
                red1.Close();
                string sql = "insert into uplodef values('" + file + "'," + txttechid.Text + ");";
                SqlCommand cmd = new SqlCommand(sql, cn);
                cmd.ExecuteNonQuery();
                FileUpload3.SaveAs(Server.MapPath("~/ADMIN/file/" + file));
                Response.Write("<script>alert('uplode sucess');</script>");
                cn.Close();
                
            }
            else
            {
                Response.Write("<script>alert('techid allready available');</script>");
                MultiView1.ActiveViewIndex = 0;
                red1.Close();
            }
        }
        else
        {
            Response.Write("<script>alert('please select your file');</script>");
        }
    }

    protected void txtuser_TextChanged(object sender, EventArgs e)
    {

    }
}