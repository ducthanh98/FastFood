using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class HoaDon
    {
        public int MaHoaDon { set; get; }
        public HoaDon_ComBo cb { set; get; }
        public HoaDon_SanPham sp { set; get; }
        public decimal TongTien { set; get; }
    }
}
