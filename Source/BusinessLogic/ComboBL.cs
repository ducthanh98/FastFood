using Common;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class ComboBL : BusinessLogic<Combo_REL>
    {
        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public List<Combo_REL> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Combo_SanPham> REL_GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            List<Combo_REL> listCombo = this.GetAllBy(pageNumber, pageSize, keyText, out totalEntries);
            List<Combo_SanPham> listCombo_Product = new List<Combo_SanPham>();
            List<int> idList = listCombo.Select(x=>x.MaCombo).Distinct().ToList();
            foreach(int id in idList)
            {
                Combo_SanPham cb_sp = new Combo_SanPham();
                cb_sp.MaCombo = id;
                IEnumerable<Combo_REL> tmp = listCombo.Where(x => x.MaCombo.Equals(id));
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

        public Combo_REL GetByID(int ID)
        {
            throw new NotImplementedException();
        }
        public Combo_SanPham SelectByPrimaryKey(int ID)
        {
            List<Combo_REL> listCombo = new SqlHelper<Combo_REL>().ExecuteProcAndGetData("CTCombo_SelectByPrimaryKey", "MaCombo", ID);
            Combo_SanPham cb_sp = new Combo_SanPham();
            cb_sp.MaCombo = ID;
            cb_sp.TenCombo = listCombo.FirstOrDefault().TenCombo;
            cb_sp.DonGia = listCombo.FirstOrDefault().DonGia;
            cb_sp.HinhAnh = listCombo.FirstOrDefault().HinhAnh;
            cb_sp.sanPham = listCombo.Select(x => new SanPham_REL() { TenSanPham = x.TenSanPham, SoLuong = x.SoLuong, MaSanPham = x.MaSanPham }).ToList();
            return cb_sp;
        }

        public bool Insert(Combo_REL obj)
        {
            throw new NotImplementedException();
        }
        public bool Insert(Combo_Insert obj)
        {
            return new SqlHelper<Combo_Insert>().ExecuteProc("CTCombo_Insert",obj);
        }

        public bool Update(Combo_REL obj)
        {
            throw new NotImplementedException();
        }
        public bool Update(Combo_Insert obj)
        {
            return new SqlHelper<Combo_Insert>().ExecuteProc("CTCombo_Update", obj);
        }

        public List<Combo_REL> GetAllBy(int pageNumber, int pageSize, string keyText, out int totalEntries)
        {
            return new SqlHelper<Combo_REL>().ExecuteProcAndGetData("CTCombo_GetAllBy", pageNumber, pageSize, keyText, out totalEntries);
        }
    }
}
