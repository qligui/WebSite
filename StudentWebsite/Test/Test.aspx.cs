using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetTestTableAdapters;

namespace StudentWebsite.Test
{
    public partial class Test : System.Web.UI.Page
    {
        static int poInts = 0;//单选题分数
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int TestId = 1; TestId <= DLTest.Items.Count; TestId++)
            {
                Label lblTest = (Label)DLTest.Items[TestId - 1].FindControl("labelQuestion");
                lblTest.Text = TestId.ToString() + ".";
            }
            if(!Convert.ToBoolean(Session["是否登录"]))
            {
                Response.Redirect("~/Internet/HTML提示登录.htm");
            }
        }

        protected void BtnTest_Click(object sender, EventArgs e)
        {
            poInts = 0;
            T_TestQustionTableAdapter adapter = new T_TestQustionTableAdapter();
            var datas = adapter.GetData();
            for (int i = 0; i < DLTest.Items.Count; i++)
            {
                var data = datas[i];
                long answerId = Convert.ToInt64(data.QustionId);
                RadioButtonList rbl = (RadioButtonList)DLTest.Items[i].FindControl("RBnTest");
                if (rbl.SelectedValue == "")
                {
                    ClientScript.RegisterStartupScript(GetType(), "警告", "alert('请选择题目，答案不能为空')", true);
                    goto finsh;
                }
                else
                {
                    if (adapter.GetDataByAnswer(answerId).Single().Answer == rbl.SelectedValue)
                    {
                        poInts += 100 / DLTest.Items.Count;
                    }
                }
            }
            T_TestScoreTableAdapter scoreadapter = new T_TestScoreTableAdapter();
            scoreadapter.IncScore(Convert.ToInt64(Session["UserId"]), poInts, DateTime.Now);
            finsh:return;
        }

    }
}