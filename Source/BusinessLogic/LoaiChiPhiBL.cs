using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAO;
using System.Web.ModelBinding;

namespace BusinessLogic
{
    public class LoaiChiPhiBL:BusinessLogic<LoaiChiPhiDAO>
    {
        public bool Insert(LoaiChiPhiDAO obj)
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProc("CTLoaiChiPhi_Insert", obj);
        }
        public bool Update(LoaiChiPhiDAO obj)
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProc("CTLoaiChiPhi_Update", obj);
        }

        public bool Delete(int ID)
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProc("CTLoaiChiPhi_DeleteByPrimaryKey", "MaLoaiChiPhi", ID);
        }

        public LoaiChiPhiDAO GetByID(int ID)
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProcAndGetData("CTLoaiChiPhi_SelectByPrimaryKey", "MaLoaiChiPhi",ID).FirstOrDefault();
        }

        public List<LoaiChiPhiDAO> GetAllBy(int pageNumber,int pageSize,string keyText, out int totalEntries)
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProcAndGetData("CTLoaiChiPhi_GetAllBy",pageNumber,pageSize,keyText, out totalEntries);
        }

        public int GetAllEntries()
        {
            return new SqlHelper<LoaiChiPhiDAO>().GetTotalRow("LoaiChiPhi");
        }

        public List<LoaiChiPhiDAO> GetAll()
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProcAndGetData("CTLoaiChiPhi_SelectAll");
        }
    }
}
