using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using DAO;

namespace BusinessLogic
{
    public class ChiNhanhBL : BusinessLogic<ChiNhanhDAO>
    {
        public bool Insert(ChiNhanhDAO obj)
        {
            return new SqlHelper<ChiNhanhDAO>().ExecuteProc("CTChiNhanh_Insert", obj);
        }

        public bool Update(ChiNhanhDAO obj)
        {
            return new SqlHelper<ChiNhanhDAO>().ExecuteProc("CTChiNhanh_Update", obj);
        }

        public bool Delete(int ID)
        {
            return new SqlHelper<ChiNhanhDAO>().ExecuteProc("CTChiNhanh_DeleteByPrimaryKey", "MaLoaiChiPhi", ID);
        }

        public ChiNhanhDAO GetByID(int ID)
        {
            return new SqlHelper<ChiNhanhDAO>().ExecuteProcAndGetData("CTChiNhanh_SelectByPrimaryKey", "MaChiNhanh", ID).FirstOrDefault();
        }

        public List<ChiNhanhDAO> GetAllBy(int pageNumber, int pageSize, string keyText,out int totalEntries)
        {
            return new SqlHelper<ChiNhanhDAO>().ExecuteProcAndGetData("CTChiNhanh_GetAllBy", pageNumber, pageSize, keyText,out totalEntries);
        }

        public List<ChiNhanhDAO> GetAll()
        {
            return new SqlHelper<ChiNhanhDAO>().ExecuteProcAndGetData("CTChiNhanh_SelectAll");
        }

        public int GetAllEntries()
        {
            return new SqlHelper<ChiNhanhDAO>().GetTotalRow("ChiNhanh");
        }
    }
}
