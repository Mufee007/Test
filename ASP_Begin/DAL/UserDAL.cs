using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ASP_Begin.Models;
using System.Data;
namespace ASP_Begin.DAL
{
    public class UserDAL:My_Connection
    {
        public DataTable GetLoginDetails(UserModel User)
        {
            DataTable dt = new DataTable();
            try
            {
                _initObjects("SP_User");
                cmd.Parameters.AddWithValue("@Action", "GetUserDetailsByUserIdandPassword");
                cmd.Parameters.AddWithValue("@UserName", User.UserName);
                cmd.Parameters.AddWithValue("@Password", User.Password);
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
    }
}