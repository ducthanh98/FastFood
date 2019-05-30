using Common;
using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class SanPhamBL : BusinessLogic<SanPhamDAO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }


        public List<SanPhamDAO> GetAll()
        {
            return new SqlHelper<SanPhamDAO>().ExecuteProcAndGetData("CTSanPham_GetAll");
        }
        public List<SanPham_TypeInsertCombo> SelectAllForCombo()
        {
            return new SqlHelper<SanPham_TypeInsertCombo>().ExecuteProcAndGetData("CTSanPham_SelectAll");
        }


        public List<SanPhamDAO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            return new SqlHelper<SanPhamDAO>().ExecuteProcAndGetData("CTSanPham_GetAllBy", pageNumber, pageSize, keyText, out totalEntries);
        }

        public int GetAllEntries()
        {
            throw new NotImplementedException();
        }

        public SanPhamDAO GetByID(int ID)
        {

            return new SqlHelper<SanPhamDAO>().ExecuteProcAndGetData("CTSanPham_SelectByPrimaryKey", "MaSanPham", ID).FirstOrDefault(); 
        }

        public bool Insert(SanPhamDAO obj)
        {
            return new SqlHelper<SanPhamDAO>().ExecuteProc("CTSanPham_Insert", obj);

        }

        public bool Update(SanPhamDAO obj)
        {
            return new SqlHelper<SanPhamDAO>().ExecuteProc("CTSanPham_Update", obj);
        }
        public List<SanPham_LoaiSanPham> SP_GetAllBy(int ID)
        {
            return new SqlHelper<SanPham_LoaiSanPham>().ExecuteProcAndGetData("CTSanPham_SelectByLSP", "MaLoaiSanPham",ID);
        }
    }
}
