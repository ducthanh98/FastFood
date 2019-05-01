using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DTO;

namespace BusinessLogic
{
    public class LoaiChiPhiBL:BusinessLogic<LoaiChiPhiDTO>
    {
        public bool Insert(LoaiChiPhiDTO obj)
        {
            return new SqlHelper<LoaiChiPhiDTO>().ExecuteProc("CTLoaiChiPhi_Insert", obj);
        }
        public bool Update(LoaiChiPhiDTO obj)
        {
            return new SqlHelper<LoaiChiPhiDTO>().ExecuteProc("CTLoaiChiPhi_Update", obj);
        }

        public bool Delete(int ID)
        {
            return new SqlHelper<LoaiChiPhiDTO>().ExecuteProc("CTLoaiChiPhi_DeleteByPrimaryKey", "MaLoaiChiPhi", ID);
        }

        public LoaiChiPhiDTO GetByID(int ID)
        {
            return new SqlHelper<LoaiChiPhiDTO>().ExecuteProcAndGetData("CTLoaiChiPhi_SelectByPrimaryKey", "MaLoaiChiPhi",ID).FirstOrDefault();
        }

        public List<LoaiChiPhiDTO> GetAllBy(int pageNumber,int pageSize,string keyText, out int totalEntries)
        {
            return new SqlHelper<LoaiChiPhiDTO>().ExecuteProcAndGetData("CTLoaiChiPhi_GetAllBy",pageNumber,pageSize,keyText, out totalEntries);
        }

        public int GetAllEntries()
        {
            return new SqlHelper<LoaiChiPhiDTO>().GetTotalRow("LoaiChiPhi");
        }

        public List<LoaiChiPhiDTO> GetAll()
        {
            return new SqlHelper<LoaiChiPhiDTO>().ExecuteProcAndGetData("CTLoaiChiPhi_SelectAll");
        }
    }
}
