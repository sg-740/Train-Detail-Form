<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="Train Detail.aspx.cs" Inherits="Train_Detail.Train_Detail" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Train Details</title>
    <style>
        /* styles.css */
        body {
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h3 {
            color: #343a40;
        }

        .text-danger {
            color: #dc3545;
        }

        .text-success {
            color: #28a745;
        }
    </style>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h3 class="mb-4">Search Train Details</h3>
            <div class="form-row mb-3">
                <div class="form-group col-md-3">
                    <label for="TxtFromDate">From Date</label>
                    <asp:TextBox ID="TxtFromDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:Label ID="MessageFromDate" runat="server" CssClass="text-danger"></asp:Label>
                </div>
                <div class="form-group col-md-3">
                    <label for="TxtToDate">To Date</label>
                    <asp:TextBox ID="TxtToDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:Label ID="MessageToDate" runat="server" CssClass="text-danger"></asp:Label>
                </div>
                <div class="form-group col-md-3">
                    <label for="DropDownListFromStation">From Station</label>
                    <asp:DropDownList ID="DropDownListFromStation" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Choose Any</asp:ListItem>
                        <asp:ListItem Value="1">Thane</asp:ListItem>
                        <asp:ListItem Value="2">Mulund</asp:ListItem>
                        <asp:ListItem Value="3">Nahur</asp:ListItem>
                        <asp:ListItem Value="4">Bhandup</asp:ListItem>
                        <asp:ListItem Value="5">Kanjur Marg</asp:ListItem>
                        <asp:ListItem Value="6">Vikhroli</asp:ListItem>
                        <asp:ListItem Value="7">Ghatkopar</asp:ListItem>
                        <asp:ListItem Value="8">Govandi</asp:ListItem>
                        <asp:ListItem Value="9">VidyaVihar</asp:ListItem>
                        <asp:ListItem Value="10">TilakNagar</asp:ListItem>
                        <asp:ListItem Value="11">Chembur</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="MessageFromStation" runat="server" CssClass="text-danger"></asp:Label>
                </div>
                <div class="form-group col-md-3">
                    <label for="DropDownListToStation">To Station</label>
                    <asp:DropDownList ID="DropDownListToStation" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Choose Any</asp:ListItem>
                        <asp:ListItem Value="1">VidyaVihar</asp:ListItem>
                        <asp:ListItem Value="2">Govandi</asp:ListItem>
                        <asp:ListItem Value="3">Ghatkopar</asp:ListItem>
                        <asp:ListItem Value="4">Vikhroli</asp:ListItem>
                        <asp:ListItem Value="5">Kanjur Marg</asp:ListItem>
                        <asp:ListItem Value="6">Bhandup</asp:ListItem>
                        <asp:ListItem Value="7">Nahur</asp:ListItem>
                        <asp:ListItem Value="8">Mulund</asp:ListItem>
                        <asp:ListItem Value="9">Thane</asp:ListItem>
                        <asp:ListItem Value="10">TilakNagar</asp:ListItem>
                        <asp:ListItem Value="11">Chembur</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="MessageToStation" runat="server" CssClass="text-danger"></asp:Label>
                </div>

            </div>
            <div class="text-center mt-3">
                <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
            </div>
            <asp:Label ID="lblPageMessage" runat="server" CssClass="text-success mt-3"></asp:Label>
        </div>

        <div class="container mt-4">
            <asp:GridView ID="GridViewTrainDetails" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="TrainName" HeaderText="Train Name" />
                    <asp:BoundField DataField="PNRNumber" HeaderText="PNR Number" />
                    <asp:BoundField DataField="Timing" HeaderText="Timing" />
                    <asp:BoundField DataField="PlatformNumber" HeaderText="Platform Number" />
                    <asp:BoundField DataField="TotalFare" HeaderText="Total Fare" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="DateOfJourney" HeaderText="Date Of Journey" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <!-- Bootstrap JavaScript and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
