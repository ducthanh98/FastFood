using Common;
using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class ReportBL
    {
        public List<ChartReport> DataForChart(int? MaChiNhanh)
        {
            return new SqlHelper<ChartReport>().ExecuteProcAndGetData("CTReport_Dashboard_Chart", "MaChiNhanh", MaChiNhanh);
        }

    }
}
