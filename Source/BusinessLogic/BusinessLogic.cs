using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    interface BusinessLogic<T>
    {  
        bool Insert(T obj);

        bool Update(T obj);

        bool Delete(int ID);

        T GetByID(int ID);

        List<T> GetAllBy(int pageNumber, int pageSize, string keyText,out int totalEntries);
        List<T> GetAll();

    }
}
