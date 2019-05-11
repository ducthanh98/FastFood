using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using Common;


namespace BusinessLogic
{
    public class ChiPhiBL : BusinessLogic<ChiPhiDTO>
    {
        public bool Delete(int ID)
        {
            return new SqlHelper<ChiPhiDTO>().ExecuteProc("CTChiPhi_DeleteByPrimaryKey", "MaChiPhi", ID);
        }

        public List<ChiPhiDTO> GetAll()
        {
            return new SqlHelper<ChiPhiDTO>().ExecuteProcAndGetData("CTChiPhi_SelectAll");
        }

        public List<ChiPhiDTO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            return new SqlHelper<ChiPhiDTO>().ExecuteProcAndGetData("CTChiPhi_GetAllBy", pageNumber, pageSize, keyText, out totalEntries);
        }

        public int GetAllEntries()
        {
            return new SqlHelper<ChiPhiDTO>().GetTotalRow("ChiPhi");
        }

        public ChiPhiDTO GetByID(int ID)
        {
            return new SqlHelper<ChiPhiDTO>().ExecuteProcAndGetData("CTChiPhi_SelectbyPrimaryKey", "MaChiPhi", ID).FirstOrDefault();
        }

        public bool Insert(ChiPhiDTO obj)
        {
            return new SqlHelper<ChiPhiDTO>().ExecuteProc("CTChiPhi_Insert", obj);
        }

        public bool Update(ChiPhiDTO obj)
        {
            return new SqlHelper<ChiPhiDTO>().ExecuteProc("CTChiPhi_Update", obj);
        }
    }
}
