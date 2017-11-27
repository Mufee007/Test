using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using ASP_Begin.Models;
namespace ASP_Begin.DAL
{
    public class DesignationDAL:My_Connection
    {
        public DataTable _SelectAllDesignation()
        {
            DataTable dt = new DataTable();
            try
            {
                _initObjects("SP_Designation");
                cmd.Parameters.AddWithValue("@Action", "GetAllDesignation");
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                CloseCon();
                throw ex;
            }
            finally
            {
                CloseCon();
            }
            return dt;
        }
        public DataTable _SelectActiveDesignation()
        {
            DataTable dt = new DataTable();
            try
            {
                _initObjects("SP_Designation");
                cmd.Parameters.AddWithValue("@Action", "GetActiveDesignation");
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                CloseCon();
                throw ex;
            }
            finally
            {
                CloseCon();
            }
            return dt;
        }
        public string _insertUpdateDeleteDesignation(DesignationModel Dpt, string _Action)
        {
            string _result = "";
            try
            {
                _initObjects("SP_Designation");
                cmd.Parameters.AddWithValue("@DesignationId", Dpt.DesignationId);
                cmd.Parameters.AddWithValue("@DesignationName", Dpt.DesignationName);
                cmd.Parameters.AddWithValue("@Description", Dpt.Description);
                cmd.Parameters.AddWithValue("@IsActive", Dpt.IsActive);
                cmd.Parameters.AddWithValue("@Action", _Action);
                _result = cmd.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                CloseCon();
                throw ex;

            }
            finally
            {
                CloseCon();
            }
            return _result;
        }
    }
}