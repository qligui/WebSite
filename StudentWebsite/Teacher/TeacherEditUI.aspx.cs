using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetUserTableAdapters;

namespace StudentWebsite.Teacher
{
    public partial class TeacherEditUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            T_TeacherTableAdapter adapter = new T_TeacherTableAdapter();
            adapter.InsTeacher(txttecherId.Text, SEHelper.MD5Helper.GetMD5(txtPwd.Text + "$%1"));
            Response.Redirect("TeacherMange.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("TeacherMange.aspx");
        }
    }
}