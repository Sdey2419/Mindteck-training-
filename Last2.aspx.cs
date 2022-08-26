using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Last2 : System.Web.UI.Page
    {
        SqlConnection SqlCon = new SqlConnection();
        SqlCommand com = new SqlCommand();
        string myConnectionString = ConfigurationManager.ConnectionStrings["StrCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRegistrationDetails();

            }

        }
        private void LoadRegistrationDetails()
        {
            try
            {
                SqlCon.ConnectionString = (myConnectionString);
                SqlCon.Open();
                com = new SqlCommand("GetStudentsDetails", SqlCon);// passing stored proc name here 
                com.CommandType = CommandType.StoredProcedure; // stored proc
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                da.Fill(ds);
                grdDetails.DataSource = ds;
                grdDetails.DataBind();
                SqlCon.Close();


            }

            catch (Exception ex)
            {
                throw ex;

            }

        }
       

        protected void grdDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdDetails.EditIndex = e.NewEditIndex;
            LoadRegistrationDetails();
        }

        protected void grdDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdDetails.EditIndex = -1;
            LoadRegistrationDetails();
        }
        protected void grdDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lbldlt = grdDetails.Rows[e.RowIndex].FindControl("lblid") as Label;
            TextBox txt_fname = grdDetails.Rows[e.RowIndex].FindControl("txtFirst") as TextBox;
            TextBox txt_lname = grdDetails.Rows[e.RowIndex].FindControl("txtLast") as TextBox;
            TextBox txt_MobileNumber = grdDetails.Rows[e.RowIndex].FindControl("txtMobile") as TextBox;
            TextBox txt_Email = grdDetails.Rows[e.RowIndex].FindControl("txtEmail") as TextBox;

            SqlCon.ConnectionString = (myConnectionString);
            SqlCon.Open();
            SqlCommand cmd = new SqlCommand("UpdateRegDetails", SqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", lbldlt.Text);
            cmd.Parameters.AddWithValue("@FirstName", txt_fname.Text);
            cmd.Parameters.AddWithValue("@LastName", txt_lname.Text);
            cmd.Parameters.AddWithValue("@Mobile", txt_MobileNumber.Text);
            cmd.Parameters.AddWithValue("@Email", txt_MobileNumber.Text);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Write("<script> alert('Data Updated Succesfully'); </script>");
            }
            SqlCon.Close();
            LoadRegistrationDetails();

        }

        protected void grdDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                LoadRegistrationDetails();
                grdDetails.PageIndex = e.NewPageIndex;
                grdDetails.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;

            }
        }

        protected void grdDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlCon.ConnectionString = (myConnectionString);
            SqlCon.Open();
            SqlCommand cmd = new SqlCommand("delete from customerdetails where Id='" + Convert.ToInt32(grdDetails.DataKeys[e.RowIndex].Value.ToString()) + "'", SqlCon);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Write("<script> alert('Student data Deleted Succesfully'); </script>");
            }
            SqlCon.Close();
            LoadRegistrationDetails();
        }

    }
}