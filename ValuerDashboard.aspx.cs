using System;
using System.Collections.Generic;
using System.Linq;

namespace ValuerPortal
{
    public partial class ValuerDashboard : System.Web.UI.Page
    {
        // Strongly typed model for inspection records.
        public class Inspection
        {
            public int Id { get; set; }
            public string LeadNo { get; set; }
            public string CustomerName { get; set; }
            public string VehicleNo { get; set; }
            public string Status { get; set; }
            public string LatestRemark { get; set; }
            public DateTime Date { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDashboard();
            }
        }

        private void BindDashboard()
        {
            // Mock inspection data (10 records).
            var inspections = new List<Inspection>
            {
                new Inspection { Id = 1, LeadNo = "LD-1001", CustomerName = "Amit Sharma", VehicleNo = "MH12AB1234", Status = "Pending",  LatestRemark = "Awaiting vehicle documents", Date = DateTime.Today.AddDays(-1) },
                new Inspection { Id = 2, LeadNo = "LD-1002", CustomerName = "Riya Mehta", VehicleNo = "MH14CD5678", Status = "Complete", LatestRemark = "Inspection completed successfully", Date = DateTime.Today.AddDays(-2) },
                new Inspection { Id = 3, LeadNo = "LD-1003", CustomerName = "Karan Patel", VehicleNo = "GJ01EF9988", Status = "Pending",  LatestRemark = "Customer requested reschedule", Date = DateTime.Today.AddDays(-4) },
                new Inspection { Id = 4, LeadNo = "LD-1004", CustomerName = "Neha Rao", VehicleNo = "KA05GH1122", Status = "Complete", LatestRemark = "Minor scratches noted", Date = DateTime.Today.AddDays(-5) },
                new Inspection { Id = 5, LeadNo = "LD-1005", CustomerName = "Imran Khan", VehicleNo = "DL08IJ3344", Status = "Complete", LatestRemark = "All parameters verified", Date = DateTime.Today.AddDays(-3) },
                new Inspection { Id = 6, LeadNo = "LD-1006", CustomerName = "Pooja Nair", VehicleNo = "TN10KL7788", Status = "Pending",  LatestRemark = "Engine noise check pending", Date = DateTime.Today.AddDays(-6) },
                new Inspection { Id = 7, LeadNo = "LD-1007", CustomerName = "Sanjay Das", VehicleNo = "WB20MN6655", Status = "Complete", LatestRemark = "Final valuation submitted", Date = DateTime.Today },
                new Inspection { Id = 8, LeadNo = "LD-1008", CustomerName = "Anu Joseph", VehicleNo = "KL07OP4567", Status = "Pending",  LatestRemark = "Location confirmation required", Date = DateTime.Today.AddDays(-7) },
                new Inspection { Id = 9, LeadNo = "LD-1009", CustomerName = "Vikram Singh", VehicleNo = "RJ14QR8910", Status = "Complete", LatestRemark = "Completed with clean report", Date = DateTime.Today.AddDays(-8) },
                new Inspection { Id = 10, LeadNo = "LD-1010", CustomerName = "Sneha Iyer", VehicleNo = "AP16ST2468", Status = "Pending",  LatestRemark = "Waiting for customer availability", Date = DateTime.Today.AddDays(-9) }
            };

            // Calculate summary tile counts.
            var pendingCount = inspections.Count(i => string.Equals(i.Status, "Pending", StringComparison.OrdinalIgnoreCase));
            var completedCount = inspections.Count(i => string.Equals(i.Status, "Complete", StringComparison.OrdinalIgnoreCase));
            var totalCount = inspections.Count;

            litPendingCount.Text = pendingCount.ToString();
            litCompletedCount.Text = completedCount.ToString();
            litTotalCount.Text = totalCount.ToString();

            // Bind latest 5 records sorted by date (descending).
            gvLatestLeadRemarks.DataSource = inspections
                .OrderByDescending(i => i.Date)
                .Take(5)
                .ToList();
            gvLatestLeadRemarks.DataBind();
        }

        // Returns Bootstrap badge color class based on status.
        protected string GetStatusBadgeClass(object statusObj)
        {
            var status = Convert.ToString(statusObj);
            return string.Equals(status, "Pending", StringComparison.OrdinalIgnoreCase)
                ? "text-bg-warning"
                : "text-bg-success";
        }
    }
}
