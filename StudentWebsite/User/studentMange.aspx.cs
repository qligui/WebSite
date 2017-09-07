using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetUserTableAdapters;

namespace StudentWebsite
{
    public partial class studentMange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "resetPwd")
            {
                int index = ((ListViewDataItem)e.Item).DisplayIndex;
                long id = (long)LvStudent.DataKeys[index].Value;
                T_UserTableAdapter adapter = new T_UserTableAdapter();
                adapter.IncPwd(SEHelper.MD5Helper.GetMD5("123456$%1"), id);
                LvStudent.DataBind();
                ClientScript.RegisterStartupScript(GetType(), "警告", "alert('密码已成功重置')", true);

            }
            else
            {
                throw new Exception("此控件异常"+e.CommandName);
            }
        }
    }
}