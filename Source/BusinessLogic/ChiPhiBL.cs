using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using DAO;

namespace BusinessLogic
{
    public class ChiPhiBL : BusinessLogic<ChiPhiDAO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<ChiPhiDAO> GetAll()
        {
            return new SqlHelper<ChiPhiDAO>().ExecuteProcAndGetData("CTChiPhi_SelectAll");
        }

        public List<ChiPhiDAO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            return new SqlHelper<ChiPhiDAO>().ExecuteProcAndGetData("CTChiPhi_GetAllBy", pageNumber, pageSize, keyText, out totalEntries);
        }

        public ChiPhiDAO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(ChiPhiDAO obj)
        {
            return new SqlHelper<ChiPhiDAO>().ExecuteProc("CTChiPhi_Insert", obj);
        }

        public bool Update(ChiPhiDAO obj)
        {
            return new SqlHelper<ChiPhiDAO>().ExecuteProc("CTChiPhi_Update", obj);
        }
    }
}
