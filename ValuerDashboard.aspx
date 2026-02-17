<%@ Page Title="Valuer Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ValuerDashboard.aspx.cs" Inherits="ValuerPortal.ValuerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- FontAwesome for dashboard icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" />

    <style>
        .dashboard-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem;
        }

        .summary-card {
            border: 0;
            border-radius: 1rem;
            box-shadow: 0 10px 22px rgba(15, 23, 42, 0.08);
            min-height: 140px;
        }

        .summary-card .tile-count {
            font-size: clamp(1.7rem, 4vw, 2.2rem);
            font-weight: 700;
            line-height: 1;
        }

        .summary-card .tile-label {
            font-size: 0.88rem;
            opacity: 0.95;
            letter-spacing: 0.2px;
        }

        .section-title {
            font-weight: 700;
            color: #1f2937;
            margin: 1.25rem 0 0.8rem;
        }

        .remarks-card {
            border: 0;
            border-radius: 1rem;
            box-shadow: 0 10px 22px rgba(15, 23, 42, 0.08);
        }

        .table thead th {
            white-space: nowrap;
            font-size: 0.87rem;
        }

        .table tbody td {
            vertical-align: middle;
            font-size: 0.9rem;
        }

        /* Optimized spacing for small mobile widths (360px+) */
        @media (max-width: 420px) {
            .dashboard-wrapper {
                padding: 0.75rem;
            }

            .summary-card {
                min-height: 125px;
            }

            .summary-card .tile-count {
                font-size: 1.5rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-wrapper">
        <!-- Summary Tiles Section -->
        <div class="row g-3">
            <div class="col-6 col-lg-4">
                <div class="card summary-card text-white bg-warning">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <span class="tile-label">Pending Inspections</span>
                            <i class="fa-solid fa-clock fa-lg"></i>
                        </div>
                        <asp:Literal ID="litPendingCount" runat="server" CssClass="tile-count" />
                    </div>
                </div>
            </div>

            <div class="col-6 col-lg-4">
                <div class="card summary-card text-white bg-success">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <span class="tile-label">Completed Inspections</span>
                            <i class="fa-solid fa-circle-check fa-lg"></i>
                        </div>
                        <asp:Literal ID="litCompletedCount" runat="server" CssClass="tile-count" />
                    </div>
                </div>
            </div>

            <div class="col-6 col-lg-4">
                <div class="card summary-card text-white bg-primary">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <span class="tile-label">Total Inspections</span>
                            <i class="fa-solid fa-chart-column fa-lg"></i>
                        </div>
                        <asp:Literal ID="litTotalCount" runat="server" CssClass="tile-count" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Latest Lead Remarks Section -->
        <h5 class="section-title">Latest Lead Remarks</h5>
        <div class="card remarks-card">
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvLatestLeadRemarks" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-hover table-striped align-middle mb-0"
                        GridLines="None"
                        EmptyDataText="No inspection records available.">
                        <Columns>
                            <asp:BoundField DataField="LeadNo" HeaderText="Lead No" />
                            <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                            <asp:BoundField DataField="VehicleNo" HeaderText="Vehicle No" />

                            <!-- Status with badge styling -->
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='badge <%# GetStatusBadgeClass(Eval("Status")) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="LatestRemark" HeaderText="Latest Remark" />
                            <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
