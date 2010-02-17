<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<run.Models.Activity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
             <p>
                <label for="personid">personid:</label>
                <%= Html.TextBox("personid") %>
                <%= Html.ValidationMessage("personid", "*") %>
            </p>
            <p>
                <label for="date">date:</label>
                <%= Html.TextBox("date") %>
                <%= Html.ValidationMessage("date", "*") %>
            </p>
            <p>
                <label for="sportid">sportid:</label>
                <%= Html.TextBox("sportid") %>
                <%= Html.ValidationMessage("sportid", "*") %>
            </p>
            <p>
                <label for="description">description:</label>
                <%= Html.TextBox("description") %>
                <%= Html.ValidationMessage("description", "*") %>
            </p>
            <p>
                <label for="kilometres">kilometres:</label>
                <%= Html.TextBox("kilometres") %>
                <%= Html.ValidationMessage("kilometres", "*") %>
            </p>
            <p>
                <label for="hours">hours:</label>
                <%= Html.TextBox("hours") %>
                <%= Html.ValidationMessage("hours", "*") %>
            </p>
            <p>
                <label for="comment">comment:</label>
                <%= Html.TextBox("comment") %>
                <%= Html.ValidationMessage("comment", "*") %>
            </p>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

