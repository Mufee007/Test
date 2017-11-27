using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using ASP_Begin.Models;
namespace ASP_Begin.DAL
{
    public class DepartmentDAL:My_Connection
    {
        public DataTable getpivot()
        {
            DataTable dt = new DataTable();
            try
            {
                _initObjects("sp_testpivot");                
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
        public DataTable getAGRPDATA()
        {
            DataTable dt = new DataTable();
            try
            {
                _initObjects("sp_rptAgpOverTime");
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
        public DataTable _SelectAllDepartment()
        {
            DataTable dt = new DataTable();
            try
            {
                _initObjects("SP_Department");
                cmd.Parameters.AddWithValue("@Action", "GetAllDepartment");
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

        public DataTable _SelectActiveDepartment()
        {
            DataTable dt = new DataTable();
            try
            {
                _initObjects("SP_Department");
                cmd.Parameters.AddWithValue("@Action", "GetActiveDepartment");
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
        public string _insertUpdateDeleteDepartment(DepartmentModel Dpt, string _Action)
        {
            string _result = "";
            try
            {
                _initObjects("SP_Department");
                cmd.Parameters.AddWithValue("@DepartmentId", Dpt.DepartmentId);
                cmd.Parameters.AddWithValue("@DepartmentName", Dpt.DepartmentName);
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
        public dsGeneral LoadDepartmentReport()
        {
            dsGeneral ds = new dsGeneral();
            try
            {
                _initObjects("SP_Department");
                cmd.Parameters.AddWithValue("@Action", "GetAllDepartment");
                da.Fill(ds, "dttblDepartment");
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
            return ds;
        }
    }
}