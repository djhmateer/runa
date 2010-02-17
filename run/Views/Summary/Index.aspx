<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<run.Models.WeekSummary>>" %>
<%@ Import Namespace="run.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

  <% foreach (WeekSummary weekSummary in Model) {
         if (weekSummary.Persondata.Count == 0)
             continue;
             %>
            <table>
            <tr>
            <th></th>
            <% foreach (WeekSummaryData weekSummaryData in weekSummary.Persondata) { %>
                <th><%=Html.Encode(weekSummaryData.Week) + "/" + Html.Encode(weekSummaryData.Year) %></th>
            <%}%>
            </tr>
            <tr>
            <td>
            <%=Html.Encode(weekSummary.Personname) %>
            </td>
            <% foreach (WeekSummaryData week in weekSummary.Persondata) { %>
                <td><%=Html.Encode(week.Hours) + "hrs" %><br /><%=Html.Encode(week.Kilometers) + "kms" %></td>
            <%}%>
            </tr>
            </table>
        <% } %>
    
</asp:Content>

