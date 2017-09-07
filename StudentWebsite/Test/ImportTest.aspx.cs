using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.OleDb;
using StudentWebsite.DAL.DataSetTestTableAdapters;
using System.Configuration;
using System.Data.SqlClient;
using SEHelper;

namespace StudentWebsite.Test
{
    public partial class ImportTest : System.Web.UI.Page
    {
        private DataTable xsldata()
        {
            if (fuload.FileName == "")
            {
                lbmsg.Text = "请选择文件";
                return null;
            }
            string fileExtenSion;
            fileExtenSion = Path.GetExtension(fuload.FileName);
            if (fileExtenSion.ToLower() != ".xls" && fileExtenSion.ToLower() != ".xlsx")
            {
                lbmsg.Text = "上传的文件格式不正确";
                return null;
            }
            try
            {
                string FileName = "Excel/" + Path.GetFileName(fuload.FileName);
                if (File.Exists(Server.MapPath(FileName)))
                {
                    File.Delete(Server.MapPath(FileName));
                }
                fuload.SaveAs(Server.MapPath(FileName));
                //HDR=Yes，这代表第一行是标题，不做为数据使用 ，如果用HDR=NO，则表示第一行不是标题，做为数据来使用。系统默认的是YES  
                string connstr2003 = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath(FileName) + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=1;'";
                string connstr2007 = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath(FileName) + ";Extended Properties=\"Excel 12.0;HDR=YES\"";
                OleDbConnection conn;
                if (fileExtenSion.ToLower() == ".xls")
                {
                    conn = new OleDbConnection(connstr2003);
                }
                else
                {
                    conn = new OleDbConnection(connstr2007);
                }
                conn.Open();
                string sql = "select * from [Sheet1$]";
                OleDbCommand cmd = new OleDbCommand(sql, conn);
                DataTable dt = new DataTable();
                OleDbDataReader sdr = cmd.ExecuteReader();

                dt.Load(sdr);
                sdr.Close();
                conn.Close();
                //删除服务器里上传的文件  
                if (File.Exists(Server.MapPath(FileName)))
                {
                    File.Delete(Server.MapPath(FileName));
                }
                return dt;
            }
            catch (Exception e)
            {
                return null;
            }
        }  
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnImport_Click(object sender, EventArgs e)
        {
            DataTable dt = xsldata();
            string ConStr = ConfigurationManager.ConnectionStrings["SEntprieDBConnectionString"].ConnectionString;
            int ErrorCount = 0;//记录错误信息条数
            int InsertCount = 0;//记录插入成功条数
            int UpdateCount = 0;//记录更新信息条数
            using (SqlConnection conn = new SqlConnection(ConStr))
            {
                conn.Open();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string QuestionName = dt.Rows[i][0].ToString();
                    string OptionA = dt.Rows[i][1].ToString();
                    string OptionB = dt.Rows[i][2].ToString();
                    string OptionC = dt.Rows[i][3].ToString();
                    string OptionD = dt.Rows[i][4].ToString();
                    string Answer = dt.Rows[i][5].ToString();
                    string Degree = dt.Rows[i][6].ToString();
                    if (QuestionName != "" && OptionA != "" && OptionB != "" && Answer != "" && Degree != "")
                    {
                        using (SqlCommand cmd = conn.CreateCommand())
                        {
                            cmd.CommandText = "select count(*) from T_TestQustion where QuestionName=@QuestionName and OptionA=@OptionA and OptionB=@OptionB and Answer=@Answer and Degree=@Degree";
                            cmd.Parameters.Add(new SqlParameter("QuestionName", QuestionName));
                            cmd.Parameters.Add(new SqlParameter("OptionA", OptionA));
                            cmd.Parameters.Add(new SqlParameter("OptionB", OptionB));
                            cmd.Parameters.Add(new SqlParameter("Answer", Answer));
                            cmd.Parameters.Add(new SqlParameter("Degree", Degree));
                            int count = Convert.ToInt32(cmd.ExecuteScalar());
                            if (count > 0)
                            {
                                UpdateCount++;
                            }
                            else
                            {
                                T_TestQustionTableAdapter adapter = new T_TestQustionTableAdapter();
                                adapter.InsertTest(QuestionName,OptionA,OptionB,OptionC,OptionD,Answer,Degree);
                                InsertCount++;
                            }
                        }
                        string str = InsertCount + "条数据导入成功！" + UpdateCount + "条数据恢复" + ErrorCount + "条数据部分错误";
                        ClientScript.RegisterStartupScript(GetType(), "message", "alert('"+str+"')", true);
                    }
                    else
                    {
                        ErrorCount++;
                    }
                }
            }
        }
    }
}