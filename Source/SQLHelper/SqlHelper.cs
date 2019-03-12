using DAO;
using Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class SqlHelper<T>
    {
        private SqlConnection connection;
        private string connectionString = null;

        public string ConnectionString
        {
            get
            {
                if(this.connectionString !=null)
                {
                    return this.connectionString;
                }
                try
                {
                    return System.Configuration.ConfigurationManager.ConnectionStrings["FastFoodConnection"].ConnectionString;
                } catch(Exception e)
                {
                    throw e;
                }
            }
            set
            {
                connectionString = value;
            }
        }

        public SqlConnection Connection
        {
            get
            {
                try
                {
                    connection = new SqlConnection();
                    connection.ConnectionString = this.ConnectionString;
                    connection.Open();
                    return connection;
                } catch(Exception e)
                {
                    throw e;
                }
            }
            set { connection = value; }
        }

        public void CloseConnection()
        {
            if (connection.State == ConnectionState.Open) connection.Close();
        }

        public bool ExecuteProc(string name_proc, T obj)
        {
            bool check = true;
            SqlCommand cmdObject = null;
            try
            {
                cmdObject = new SqlCommand(name_proc, Connection);
                cmdObject.CommandType = CommandType.StoredProcedure;
                Type type = obj.GetType();
                IList<PropertyInfo> props = new List<PropertyInfo>(type.GetProperties());
                foreach (PropertyInfo prop in props)
                {
                    SqlParameter par = new SqlParameter(prop.Name, prop.GetValue(obj, null));
                    cmdObject.Parameters.Add(par);
                    // Do something with propValue
                }

                if (cmdObject.ExecuteNonQuery() == 0)
                {
                    check = false;
                }

            } catch(Exception e)
            {
                check = false;
                throw e;
            }
            finally{
                cmdObject.Dispose();
                CloseConnection();
            }
            return check;
        }

        public bool ExecuteProc(string name_proc,string Field, int ID)
        {
            bool check = true;
            SqlCommand cmdObject = null;
            try
            {
                cmdObject = new SqlCommand(name_proc, Connection);
                cmdObject.CommandType = CommandType.StoredProcedure;
                SqlParameter par = new SqlParameter(Field, ID);
                cmdObject.Parameters.Add(par);
                    // Do something with propValue
                if (cmdObject.ExecuteNonQuery() == 0)
                {
                    check = false;
                }

            }
            catch (Exception e)
            {
                check = false;
                throw e;
            }
            finally
            {
                cmdObject.Dispose();
                CloseConnection();
            }
            return check;
        }

        public List<T> ExecuteProcAndGetData(string name_proc,string Field, int ID)
        {
            List<T> result = new List<T>();
            DataSet ds = new DataSet();
            SqlCommand cmdObject = null;
            try
            {
                cmdObject = new SqlCommand(name_proc, Connection);
                cmdObject.CommandType = CommandType.StoredProcedure;
                SqlParameter par = new SqlParameter(Field, ID);
                cmdObject.Parameters.Add(par);
                // Do something with propValue
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmdObject);
                sqlDataAdapter.Fill(ds);
                result = ConvertData.ConvertDataTableToList<T>(ds.Tables[0]);
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                cmdObject.Dispose();
                CloseConnection();
            }
            return result;
        }

        public int GetTotalRow(string tablename)
        {
            int total=0;
            string selectSql = "select COUNT(*) AS totalEntries from "+tablename;
            SqlCommand cmdObject = null;
            try
            {
                cmdObject = new SqlCommand(selectSql, Connection);

                using (SqlDataReader read = cmdObject.ExecuteReader())
                {
                    while (read.Read())
                    {
                        total = (int)read["totalEntries"];
                    }
                }
            }
            finally
            {
                cmdObject.Dispose();
                CloseConnection();
            }
            return total;
        }

        public List<T> ExecuteProcAndGetData(string name_proc,int pageNumber,int pageSize, string keyText)
        {
            List<T> result = new List<T>();
            DataSet ds = new DataSet();
            SqlCommand cmdObject = null;
            try
            {
                cmdObject = new SqlCommand(name_proc, Connection);
                cmdObject.CommandType = CommandType.StoredProcedure;

                cmdObject.Parameters.Add(new SqlParameter("pageNumber", pageNumber));
                cmdObject.Parameters.Add(new SqlParameter("pageSize", pageSize));
                cmdObject.Parameters.Add(new SqlParameter("keyText", keyText));

                // Do something with propValue
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmdObject);
                sqlDataAdapter.Fill(ds);
                result = ConvertData.ConvertDataTableToList<T>(ds.Tables[0]);
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                cmdObject.Dispose();
                CloseConnection();
            }
            return result;
        }

    }
}
