<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<run.Models.weekly_summary>>" %>
<%@ Import Namespace="run.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

      <%--<%
        foreach (var weekSummary in Model) {
            } %>
            <table>
            <tr>
            <th></th>
            <% foreach (run.Models.WeekSummaryData week in WeekSummary.Persondata) { %>
                <th><%=Html.Encode(week.WeekNumber) + "/" + Html.Encode(week.Year) %></th>
            <%}%>
            </tr>
            <tr>
            <td>
            <%=Html.Encode(weekSummary.PersonName) %>
            </td>
            <% foreach (run.Models.WeekSummaryData week in weekSummary.Data) { %>
                <td><%=Html.Encode(week.Hours) + "hrs" %><br /><%=Html.Encode(week.Kilometres) + "kms" %></td>
            <%}%>
            </tr>
            </table>
        <% } %>--%>
    
    
    <table>
        <tr>
            <th>
                Person
            </th>
            <th>
                Week
            </th>
            <th>
                Year
            </th>
            <th>
                K's
            </th>
            <th>
                Hours
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.Encode(item.personid) %>
            </td>
            <td>
                <%= Html.Encode(item.Week) %>
            </td>
            <td>
                <%= Html.Encode(item.Year) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.kilometres)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.hours)) %>
            </td>
        </tr>
    
    <% } %>

    </table>
    

</asp:Content>

