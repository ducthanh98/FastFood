using Common;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class ComboBL : BusinessLogic<ComboDTO>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<ComboDTO> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Combo_SanPham> REL_GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            List<ComboDTO> listCombo = this.GetAllBy(pageNumber, pageSize, keyText, out totalEntries);
            List<Combo_SanPham> listCombo_Product = new List<Combo_SanPham>();
            List<int> idList = listCombo.Select(x=>x.MaCombo).Distinct().ToList();
            foreach(int id in idList)
            {
                Combo_SanPham cb_sp = new Combo_SanPham();
                cb_sp.MaCombo = id;
                IEnumerable<ComboDTO> tmp = listCombo.Where(x => x.MaCombo.Equals(id));
                cb_sp.TenCombo = tmp.FirstOrDefault().TenCombo;
                cb_sp.sanPham= tmp.Select(x => new SanPham_REL() { TenSanPham = x.TenSanPham, SoLuong = x.SoLuong,MaSanPham=x.MaSanPham }).ToList();
                listCombo_Product.Add(cb_sp);
            }
            return listCombo_Product;
        }

        public int GetAllEntries()
        {
            throw new NotImplementedException();
        }

        public ComboDTO GetByID(int ID)
        {
            throw new NotImplementedException();
        }

        public bool Insert(ComboDTO obj)
        {
            throw new NotImplementedException();
        }

        public bool Update(ComboDTO obj)
        {
            throw new NotImplementedException();
        }

        public List<ComboDTO> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            return new SqlHelper<ComboDTO>().ExecuteProcAndGetData("CTCombo_GetAllBy", pageNumber, pageSize, keyText, out totalEntries);
        }
    }
}
