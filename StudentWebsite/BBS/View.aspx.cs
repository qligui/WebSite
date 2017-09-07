using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetBBSTableAdapters;

namespace StudentWebsite.BBS
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                T_BBSTableAdapter adapter = new T_BBSTableAdapter();
                string action=Request["action"];
                if (action == "Read")
                {
                    adapter.IncHits(Convert.ToInt64(Request["id"]));
                    FvAnswer.ChangeMode(FormViewMode.ReadOnly);
                }
                else
                {
                    throw new Exception("action值不存在！"+action);
                    
                }
            }
        }

        protected void btnAnswer_Click(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["是否登录"]) || Convert.ToBoolean(Session["管理员是否登录"])) 
            {
                string code = Convert.ToString(Session["Code"]);
                string codeLower = Convert.ToString(Session["Codelower"]);
                if (txtYanZhen.Text==code || txtYanZhen.Text==codeLower)
                {
                    long AnswerId = Convert.ToInt64(Request["id"]);
                    T_BBSTableAdapter Questionadapter = new T_BBSTableAdapter();
                    var data = Questionadapter.GetDataById(AnswerId).Single();
                    //将论坛题目的数据插入问答数据库中
                    T_BBSAnswerTableAdapter adapter = new T_BBSAnswerTableAdapter();
                    adapter.InsertAnswer(Session["UserName"].ToString(), AnswerId, data.QuestionTitle, txtMsg.Text, DateTime.Now);
                    ClientScript.RegisterStartupScript(GetType(), "提示", "alert('评论成功！')", true);
                    Questionadapter.IncStatus(true,data.BBSId);
                }
                else
                {
                    LabError.Text = "验证码错误！";
                    return;
                }
            }
            else
            {
                Response.Redirect("~/Internet/HTML提示登录.htm");
            }
        }
    }
}