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
                        pro.SetValue(obj, dr[dc.ColumnName], null);
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
    }
}
