<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<run.Models.Activity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="activityid">activityid:</label>
                <%=Model.activityid %>
            </p>
            <p>
                <label for="personid">personid:</label>
                <%= Html.TextBox("personid", Model.personid) %>
                <%= Html.ValidationMessage("personid", "*") %>
            </p>
            <p>
                <label for="date">date:</label>
                <%= Html.TextBox("date", String.Format("{0:g}", Model.date)) %>
                <%= Html.ValidationMessage("date", "*") %>
            </p>
            <p>
                <label for="sportid">sportid:</label>
                <%= Html.TextBox("sportid", Model.sportid) %>
                <%= Html.ValidationMessage("sportid", "*") %>
            </p>
            <p>
                <label for="description">description:</label>
                <%= Html.TextBox("description", Model.description) %>
                <%= Html.ValidationMessage("description", "*") %>
            </p>
            <p>
                <label for="kilometres">kilometres:</label>
                <%= Html.TextBox("kilometres", String.Format("{0:F}", Model.kilometres)) %>
                <%= Html.ValidationMessage("kilometres", "*") %>
            </p>
            <p>
                <label for="hours">hours:</label>
                <%= Html.TextBox("hours", String.Format("{0:F}", Model.hours)) %>
                <%= Html.ValidationMessage("hours", "*") %>
            </p>
            <p>
                <label for="comment">comment:</label>
                <%= Html.TextBox("comment", Model.comment) %>
                <%= Html.ValidationMessage("comment", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>
        <% using (Html.BeginForm("delete", "activity")) {%>
        <%=Html.Hidden("id",Model.activityid) %>
        <input id="Submit1" type="submit" value="delete" />
    <% } %>


    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

