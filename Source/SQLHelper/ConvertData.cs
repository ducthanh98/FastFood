using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    class ConvertData
    {
        public static T getItemRow<T>(DataRow dr)
        {
            Type tmp = typeof(T);
            T obj = Activator.CreateInstance<T>();
            foreach (DataColumn dc in dr.Table.Columns)
            {
                foreach(PropertyInfo pro in tmp.GetProperties())
                {
                    if(pro.Name == dc.ColumnName)
                    {
                        if(dr[dc.ColumnName] == null || dr[dc.ColumnName] == DBNull.Value)
                        {
                            pro.SetValue(obj, null, null);
                        } else
                        {
                            pro.SetValue(obj, dr[dc.ColumnName], null);
                        }
                    } else
                    {
                        continue;
                    }
                }
            }

            return obj;
        }

        public static List<T> ConvertDataTableToList<T>(DataTable dt)
        {
            List<T> list = new List<T>();
            foreach(DataRow row in dt.Rows)
            {
                T item = getItemRow<T>(row);
                list.Add(item);
            }
            return list;
        }

        public static DataTable ConvertListToDatatable<T>(Object listData)
        {
            List<T> lstData = (List<T>)listData;
            DataTable table = new DataTable();
            List<PropertyInfo> props = new List<PropertyInfo>(lstData.FirstOrDefault()?.GetType().GetProperties());
            // tao cot trong bang
            foreach (PropertyInfo pro in props)
            {
                    table.Columns.Add(pro.Name, pro.PropertyType);
            }
            // them gia tri vao cac cot
            foreach (T tmp in lstData)
            {
                DataRow dr = table.NewRow();
                foreach (PropertyInfo pro in props)
                {
                    dr[pro.Name] = pro.GetValue(tmp, null);
                }
                table.Rows.Add(dr);

            }
            return table;
        }

    }
}
