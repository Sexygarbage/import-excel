using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.OleDb;
using System.Data;

namespace WebApplicationExcelExportImportBd
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Populatedata();
                lblMessage.Text = "Current Database Data!";
            }
        }

        private void Populatedata()
        {
            using (MuDatabaseEntities dc = new MuDatabaseEntities())
            {
                gvData.DataSource = dc.BookMaster.ToList();
                gvData.DataBind();
            }
        }

        protected void btnImport_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile.ContentType == "application/vnd.ms-excel" 
                || FileUpload1.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            {
                try
                {
                    string filename = Path.Combine(Server.MapPath("~/"), FileUpload1.PostedFile.FileName );
                    FileUpload1.PostedFile.SaveAs(filename);//Guid.NewGuid().ToString() ++ Path.GetExtension(FileUpload1.PostedFile.FileName)
                    string conString = "";
                    string ext = Path.GetExtension(FileUpload1.PostedFile.FileName);

                    if (ext.ToLower() == ".xls")
                    {
                        conString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source" + filename + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\""; ;
                    }
                    else if(ext.ToLower() == ".xlsx")
                    {
                        conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filename + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\""; ;
                    }
                    /*
                     * Provider=Microsoft.ACE.OLEDB.12.0;Data Source=c:\myFolder\myExcel2007file.xlsx;
Extended Properties="Excel 12.0 Xml;HDR=YES";
                     * 
                     */
                    string query = "Select [Произвидение],[автор],[страниц] from [Лист1$] order by [страниц]";
                    OleDbConnection conn = new OleDbConnection(conString);
                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        conn.Open();

                    }
                    OleDbCommand cmd = new OleDbCommand(query, conn);
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);

                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    da.Dispose();
                    conn.Close();
                    conn.Dispose();
                    gvData.DataSource = ds;
                    gvData.DataBind();
                    //Import to Database
                    //using (MuDatabaseEntities dc = new MuDatabaseEntities())
                    //{
                    //    foreach (DataRow dr in ds.Tables[0].Rows)
                    //    {
                    //        string bookId = dr["Произвидение"].ToString();
                    //        var v = dc.BookMaster.Where(a => a.BookId.Equals(bookId)).FirstOrDefault();
                    //    }
                    //}
                    lblMessage.Text = gvData.Rows[0].Cells[0].Text.ToString();
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
    }
}
