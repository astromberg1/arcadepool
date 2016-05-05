<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        #form1 {
            height: 325px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>    
    </div>
        <asp:Panel ID="Panel1" runat="server" Direction="LeftToRight" Height="122px" Width="1280px">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="DailyRentalprice" Height="29px" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ListOfRelaseDateOfGames" />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="PopularityOFGames" />
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="RentalCompany" />
            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="SeeRentalDateOfMachine" />
            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="ShowCarrierWhichProductTheyWillPickUp" />
            <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="ShowCompanyCustomers" />
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="ShowPrivateCustomers" />
            <asp:TextBox ID="TextBox1" runat="server" Height="23px"></asp:TextBox>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spDailyRentalprice" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spSeeRentalDateOfMachine" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="102" Name="ContractNumber" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spShowCarrierWhichProductTheyWillPickUp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="DHL" Name="CarrierName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spShowCompanyCustomers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spShowPrivateCustomers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ArcadePoolDBConnectionString %>" SelectCommand="spPopularityOFGames" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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