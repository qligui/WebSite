using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetBBSTableAdapters;

namespace StudentWebsite.Teacher
{
    public partial class thBBS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string WriteText(string id)
        {
            T_BBSAnswerTableAdapter adapter = new T_BBSAnswerTableAdapter();
            string ReadText = adapter.GetDataCountById(Convert.ToInt64(id)).ToString();
            return ReadText;
        }
        public string QuestionStatus(string satatus)
        {
            bool flag = Convert.ToBoolean(satatus);
            if (flag)
            {
                return "[问题已解决] ";
            }
            else
            {
                return "[问题未解决] ";
            }
        }
    }
}