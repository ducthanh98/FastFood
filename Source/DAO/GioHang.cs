using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class GioHang
    {
        public List<Combo_SanPham> cb_sp { set; get; }
        public List<SanPhamDAO> sp { set; get; }
        public int SoLuong { set; get; }
        public decimal ThanhTien { set; get; }
    }
}
