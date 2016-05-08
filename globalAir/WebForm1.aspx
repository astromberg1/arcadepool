<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ArcadePool.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ArcadePool Data</title>
    <style type="text/css">
        #form1 {
            height: 139px;
            width: 1252px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>    
    </div>
        <asp:Panel ID="Panel1" runat="server" Direction="LeftToRight" Height="122px" Width="1177px">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="DailyRentalprice" Height="29px" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ListOfRelaseDateOfGames" />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="PopularityOFGames" />
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="RentalCompany" />
            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="SeeRentalDateOfMachine" />
            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="ShowCarrierWhichProductTheyWillPickUp" />
            <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="ShowCompanyCustomers" />
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="ShowPrivateCustomers" />
            <asp:TextBox ID="TextBox1" runat="server" Height="23px"></asp:TextBox>
            <asp:CheckBox ID="Automatic" runat="server" Checked="True" OnCheckedChanged="Automatic_CheckedChanged1" />
            <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="ShowAllBookings" />
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spDailyRentalprice" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spShowallBookings" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:GridView ID="GridView10"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" AllowSorting="True" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource10" AutoGenerateColumns="False" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ContractNumber" HeaderText="ContractNumber" SortExpression="ContractNumber" />
                <asp:BoundField DataField="SerialNumber" HeaderText="SerialNumber" SortExpression="SerialNumber" />
                <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                <asp:BoundField DataField="CustomerCompany" HeaderText="CustomerCompany" SortExpression="CustomerCompany" />
                <asp:BoundField DataField="CustomerLname" HeaderText="CustomerLname" SortExpression="CustomerLname" />
                <asp:BoundField DataField="ProviderCompany" HeaderText="ProviderCompany" SortExpression="ProviderCompany" />
                <asp:BoundField DataField="ProviderLname" HeaderText="ProviderLname" SortExpression="ProviderLname" />
                <asp:BoundField DataField="CarrierName" HeaderText="CarrierName" SortExpression="CarrierName" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="ShippingDate" HeaderText="ShippingDate" SortExpression="ShippingDate" />
                <asp:BoundField DataField="RentalDate" HeaderText="RentalDate" SortExpression="RentalDate" />
                <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" SortExpression="ReturnDate" />
                <asp:BoundField DataField="TotPrice" HeaderText="TotPrice" SortExpression="TotPrice" />
                <asp:BoundField DataField="OrderLineNumber" HeaderText="OrderLineNumber" SortExpression="OrderLineNumber" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:GridView ID="GridView2"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" AllowSorting="True" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource1" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:GridView ID="GridView3"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" AllowSorting="True" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource2" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:GridView ID="GridView4"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" AllowSorting="True" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource3" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:GridView ID="GridView5"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" AllowSorting="True" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource4" AutoGenerateColumns="False" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Rental Company" HeaderText="Rental Company" SortExpression="Rental Company" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Start Rental Day" HeaderText="Start Rental Day" SortExpression="Start Rental Day" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:GridView ID="GridView6"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" AllowSorting="True" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource6" AutoGenerateColumns="False" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="CarrierName" HeaderText="CarrierName" SortExpression="CarrierName" />
                <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                <asp:BoundField DataField="SerialNumber" HeaderText="SerialNumber" SortExpression="SerialNumber" />
                <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                <asp:BoundField DataField="ContractNumber" HeaderText="ContractNumber" SortExpression="ContractNumber" />
                <asp:BoundField DataField="Provider Company" HeaderText="Provider Company" SortExpression="Provider Company" />
                <asp:BoundField DataField="ShippingDate" HeaderText="ShippingDate" SortExpression="ShippingDate" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:GridView ID="GridView7"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" AllowSorting="True" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource7" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:GridView ID="GridView8"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" AllowSorting="True" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource8" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:GridView ID="GridView9"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource9" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="DiffDate" HeaderText="DiffDate" ReadOnly="True" SortExpression="DiffDate" />
                <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                <asp:BoundField DataField="SerialNumber" HeaderText="SerialNumber" SortExpression="SerialNumber" />
                <asp:BoundField DataField="RentalDate" HeaderText="RentalDate" SortExpression="RentalDate" />
                <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" SortExpression="ReturnDate" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spShowCarrierWhichProductTheyWillPickUp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="Bring" Name="CarrierName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spShowCompanyCustomers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spShowPrivateCustomers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spSeeRentalDateOfMachine" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="" Name="ContractNumber" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spListOfRelaseDateOfGames" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spPopularityOFGames" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spRentalCompany" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1"  runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="108px" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </form>
</body>
</html>