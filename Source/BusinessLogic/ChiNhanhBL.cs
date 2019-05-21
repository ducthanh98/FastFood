using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using DTO;

namespace BusinessLogic
{
    public class ChiNhanhBL : BusinessLogic<ChiNhanhDTO>
    {
        public bool Insert(ChiNhanhDTO obj)
        {
            return new SqlHelper<ChiNhanhDTO>().ExecuteProc("CTChiNhanh_Insert", obj);
        }

        public bool Update(ChiNhanhDTO obj)
        {
            return new SqlHelper<ChiNhanhDTO>().ExecuteProc("CTChiNhanh_Update", obj);
        }

        public bool Delete(int ID)
        {
            return new SqlHelper<ChiNhanhDTO>().ExecuteProc("CTChiNhanh_DeleteByPrimaryKey", "MaLoaiChiPhi", ID);
        }

        public ChiNhanhDTO GetByID(int ID)
        {
            return new SqlHelper<ChiNhanhDTO>().ExecuteProcAndGetData("CTChiNhanh_SelectByPrimaryKey", "MaChiNhanh", ID).FirstOrDefault();
        }

        public List<ChiNhanhDTO> GetAllBy(int pageNumber, int pageSize, string keyText,out int totalEntries)
        {
            return new SqlHelper<ChiNhanhDTO>().ExecuteProcAndGetData("CTChiNhanh_GetAllBy", pageNumber, pageSize, keyText,out totalEntries);
        }

        public List<ChiNhanhDTO> GetAll()
        {
            return new SqlHelper<ChiNhanhDTO>().ExecuteProcAndGetData("CTChiNhanh_SelectAll");
        }

        public int GetAllEntries()
        {
            return new SqlHelper<ChiNhanhDTO>().GetTotalRow("ChiNhanh");
        }
    }
}
