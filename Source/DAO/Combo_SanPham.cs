using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Combo_SanPham
    {
        public int MaCombo { get; set; }
        public string TenCombo { get; set; }
        public List<SanPham_REL> sanPham { get; set; }
    }
}
