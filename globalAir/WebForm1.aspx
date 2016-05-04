<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ArcadePool.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT Gametitles.GameName, Machines.SerialNumber, Machines.DailyRentalprice FROM Gametitles INNER JOIN Machines ON Gametitles.GametitleID = Machines.GametitleID"></asp:SqlDataSource>
        <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="SqlDataSource2" />
        <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged">
        </asp:MultiView>
        <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT Customers.* FROM Customers"></asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" Text="Execute" Width="247px" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Execute" Width="247px" OnClick="Button1_Click" />
        </p>
        <asp:Panel ID="Panel2" runat="server" Height="121px" style="margin-top: 0px">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AllowSorting="True" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                    <asp:BoundField DataField="SerialNumber" HeaderText="SerialNumber" SortExpression="SerialNumber" />
                    <asp:BoundField DataField="DailyRentalprice" HeaderText="DailyRentalprice" SortExpression="DailyRentalprice" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Height="217px">
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource3" AllowSorting="True" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="CustomerID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                    <asp:BoundField DataField="CreditLine" HeaderText="CreditLine" SortExpression="CreditLine" />
                    <asp:BoundField DataField="OrganisationsNummer" HeaderText="OrganisationsNummer" SortExpression="OrganisationsNummer" />
                    <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                    <asp:BoundField DataField="zipCode" HeaderText="zipCode" SortExpression="zipCode" />
                    <asp:BoundField DataField="PhoneNr" HeaderText="PhoneNr" SortExpression="PhoneNr" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </asp:Panel>
    </form>
</body>
</html>
