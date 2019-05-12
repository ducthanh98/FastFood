using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{ 
    public class LoaiChiPhiDAO 
    {
        public int MaLoaiChiPhi { get; set; }
        public string TenLoaiChiPhi { get; set; } 
        public string MoTa { get; set; }
        public int MaChiNhanh { get; set; }

    }
}