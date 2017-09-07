using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetUserTableAdapters;

namespace StudentWebsite.Teacher
{
    public partial class TeacherMange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LvTeacher_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "teacherPwd")
            {
                int index = ((ListViewDataItem)e.Item).DisplayIndex;
                long id = (long)LvTeacher.DataKeys[index].Value;
                T_TeacherTableAdapter adapter = new T_TeacherTableAdapter();
                adapter.updatePwd(SEHelper.MD5Helper.GetMD5("123456$%1"), id);
                LvTeacher.DataBind();
                ClientScript.RegisterStartupScript(GetType(), "警告", "alert('密码已成功重置')", true);

            }
            else
            {
                throw new Exception("此控件异常" + e.CommandName);
            }
        }
    }
}