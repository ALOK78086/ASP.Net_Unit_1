<%@ Application Language="C#" %>
<script runat="server">
    void Application_Start(object sender, EventArgs e)
    {
        // Application level state - common for all users
        Application["VisitorCount"] = 0;
    }
    void Session_Start(object sender, EventArgs e)
    {
        Application.Lock();
        Application["VisitorCount"] = (int)Application["VisitorCount"] + 1;
        Application.UnLock();
    }
</script>
