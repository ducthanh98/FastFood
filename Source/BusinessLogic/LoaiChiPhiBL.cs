using DAO;
using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLogic
{
    public class LoaiChiPhiBL
    {
        public bool Insert(LoaiChiPhiDAO obj)
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProc("CTLoaiChiPhi_Insert", obj);
        }

        public bool Delete(int ID)
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProc("CTLoaiChiPhi_DeleteByPrimaryKey", "MaLoaiChiPhi", ID);
        }

        public List<LoaiChiPhiDAO> GetByID(int ID)
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProcAndGetData("CTLoaiChiPhi_SelectByPrimaryKey", "MaLoaiChiPhi",ID);
        }

        public List<LoaiChiPhiDAO> GetAllBy(int pageNumber,int pageSize,string keyText)
        {
            return new SqlHelper<LoaiChiPhiDAO>().ExecuteProcAndGetData("CTLoaiChiPhi_GetAllBy",pageNumber,pageSize,keyText);
        }

        public int GetAllEntries()
        {
            return new SqlHelper<LoaiChiPhiDAO>().GetTotalRow("LoaiChiPhi");
        }


    }
}
