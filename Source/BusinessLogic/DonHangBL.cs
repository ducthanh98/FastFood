using Common;
using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class DonHangBL : BusinessLogic<DonHangDAO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<DonHangDAO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            return new SqlHelper<DonHangDAO>().ExecuteProcAndGetData("CTDonHang_GetAllBy", pageNumber, pageSize, keyText, out totalEntries);
        }

        public DonHangDAO GetByID(int ID)
        {
            throw new NotImplementedException();
        }
        public bool UpdateByID(int ID,string status)
        {
            return new SqlHelper<DonHangDAO>().ExecuteProc("CTDonHang_UpdateStatus", "MaDonHang", ID, "TrangThai", status);
        }

        public bool Insert(DonHangDAO obj)
        {
            throw new NotImplementedException();
        }

        public bool Update(DonHangDAO obj)
        {
            throw new NotImplementedException();
        }
    }
}
