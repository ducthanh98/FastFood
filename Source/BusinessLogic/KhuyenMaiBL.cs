using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Common;

namespace BusinessLogic
{
    public class KhuyenMaiBL : BusinessLogic<KhuyenMaiDAO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<KhuyenMaiDAO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            return new SqlHelper<KhuyenMaiDAO>().ExecuteProcAndGetData("CTKhuyenMai_GetAllBy", pageNumber, pageSize, keyText, out totalEntries);
        }

        public KhuyenMaiDAO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(KhuyenMaiDAO obj)
        {
            return new SqlHelper<KhuyenMaiDAO>().ExecuteProc("CTKhuyenMai_Insert", obj);
        }

        public bool Update(KhuyenMaiDAO obj)
        {
            return new SqlHelper<KhuyenMaiDAO>().ExecuteProc("CTKhuyenMai_Update", obj);
        }

        public List<KhuyenMaiDAO> GetAll()
        {
            return new SqlHelper<KhuyenMaiDAO>().ExecuteProcAndGetData("CTKhuyenMai_SelectAll");
        }
    }
}
