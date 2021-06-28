using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.ServiceModel.Channels;

public partial class _Default : System.Web.UI.Page
{
    SQLClass mySQLClass = new SQLClass();
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            //הסתרה של החלון האפור
            //grayWindows.Visible = false;

            //הסתרת של חלונות הפופ-אפ
            //userEnter.Visible = false;

            //deleteCheck.Visible = false;
            //grayWindows2.Visible = false;
            user.Visible = false;

        }
        
        openCheck.Visible = false;
        
        newcomment.Visible = false;
        
        if (Session["userName"] != null)
        {
            user.Visible = true;
            login.Visible = false;
            if (Session["userName"].ToString() == "campleader")
            {

                openCheck.Visible = true;
                newcomment.Visible = true;
            }
            else if(Session["userName"].ToString()=="teamleader")
            {

                openCheck.Visible = false;
                
                newcomment.Visible = true;
            }
            
        }
        else
        {
            user.Visible = false;
        }
        //משתמש מחובר
        if (Session["userName"] != null)//הצגת המשתמש
        {
            user.Visible = true;
            if (Session["userName"].ToString() == "campleader")
            {
                currentUser.Text = "היי מנהלת הנופש!";
            }
            else if (Session["userName"].ToString() == "teamleader")
            {
                currentUser.Text = "היי ראש הקבוצה!";
            }

        }
        //קבלת האידי שהמשתמש לחץ עליו
        id = Convert.ToInt32(Session["id"].ToString());
        SqlDataSource1.SelectCommand = "SELECT * FROM activityMain WHERE activityID=" + id ;
        //    //קישור לנספחים
        string linkQuery = "SELECT googleDriveLink FROM Activities WHERE ID=" + id;
        DataSet linkAns = mySQLClass.SQLSelect(linkQuery);
        string link = linkAns.Tables[0].Rows[0][0].ToString();
        download.HRef = link;

        //לעדכן את כל השדות בהתאם
        string nameQury = "SELECT activityName,activityType FROM Activities WHERE ID=" + id;
        DataSet nameAnswer = mySQLClass.SQLSelect(nameQury);
        string activityName= nameAnswer.Tables[0].Rows[0][0].ToString();
        string activityType= nameAnswer.Tables[0].Rows[0][1].ToString();
        // סוג הפעולה בעברית
        switch (activityType)
        {
            case "morning":
                activityType = "פעילות בוקר";
                actTypeMenu.InnerText = "פעילויות בוקר";
                break;
            case "group":
                activityType = "פעילות קבוצה";
                actTypeMenu.InnerText = "פעילויות קבוצה";
                break;
            case "intro":
                activityType = "פעילות היכרות ותקנון";
                actTypeMenu.InnerText = "פעילויות היכרות ותקנון";
                break;
            case "endCamp":
                activityType = "פעילות סיכום ופרידה";
                actTypeMenu.InnerText = "פעילויות סיכום ופרידה";
                break;
            case "otef":
                activityType = "פעילות מתחמים";
                actTypeMenu.InnerText = "פעילויות מתחמים";
                break;
            case "community":
                activityType = "פעילות קהילתית";
                actTypeMenu.InnerText = "פעילויות קהילתית";
                break;
            case "dayClose":
                activityType = "פעילות סיכום יום";
                actTypeMenu.InnerText = "פעילויות סיכום יום";
                break;

        }
        actName.Text = activityName + ", " + activityType;

        //הצגה בתפריט של שם הפעולה
        actNameMenu.InnerText= nameAnswer.Tables[0].Rows[0][0].ToString();
        string goal1Qury= "SELECT activityGoal1 FROM Activities WHERE ID=" + id;
        DataSet goal1Answer= mySQLClass.SQLSelect(goal1Qury);
        Goal1.Text = goal1Answer.Tables[0].Rows[0][0].ToString();
        string goal2Qury = "SELECT activityGoal2 FROM Activities WHERE ID=" + id;
        DataSet goal2Answer = mySQLClass.SQLSelect(goal2Qury);
        Goal2.Text = goal2Answer.Tables[0].Rows[0][0].ToString();
        string durationQury = "SELECT activityDuration FROM Activities WHERE ID=" + id;
        DataSet durationAnswer = mySQLClass.SQLSelect(durationQury);
        duration.Text=durationAnswer.Tables[0].Rows[0][0].ToString();

        //הצגת תגובות
      string commentsNum = "SELECT COUNT(ID) FROM comments WHERE activityID=" + id;
        DataSet commentsNumAnswer = mySQLClass.SQLSelect(commentsNum);
        int commentsNum1 = Convert.ToInt32(commentsNumAnswer.Tables[0].Rows[0][0]);
        string commentQury = "SELECT comment FROM comments WHERE activityID=" + id;
        DataSet commentAnswer = mySQLClass.SQLSelect(commentQury);
        string commentDateQury = "SELECT commentDate FROM comments WHERE activityID=" + id;
        DataSet commentDateAnswer = mySQLClass.SQLSelect(commentDateQury);
       

        for (int i = commentsNum1-1; i >= 0; i--)
        {
            Label date = new Label();
            //date.CssClass = "dateCSS";
            date.Text = commentDateAnswer.Tables[0].Rows[i][0].ToString();
            string actType= nameAnswer.Tables[0].Rows[0][1].ToString();
            switch (actType)
            {
                case "morning":
                    date.CssClass = "dateCSS headYellow";
               
                    break;
                case "group":
                    date.CssClass = "dateCSS headGreen";
                    break;
                case "intro":
                    date.CssClass = "dateCSS headRed";

                    break;
                case "endCamp":
                    date.CssClass = "dateCSS headBlue";
                    break;
                case "otef":
                    date.CssClass = "dateCSS headPurple";
                    break;
                case "community":
                    date.CssClass = "dateCSS headPurple";
                    break;
                case "dayClose":
                    date.CssClass = "dateCSS headYellow";
                    break;
            }
            allComments.Controls.Add(date);
            allComments.Controls.Add(new LiteralControl("<br />"));
            
            Label comment = new Label();
            //HtmlGenericControl comment = new HtmlGenericControl("p");
            comment.CssClass = "allCommentCSS limit";
            comment.Text = commentAnswer.Tables[0].Rows[i][0].ToString();
            allComments.Controls.Add(comment);
            allComments.Controls.Add(new LiteralControl("<br />"));
            
        }

        //תגיות
        // string howManyTagsQury = "SELECT COUNT(TagTitle) FROM tags WHERE ID IN(SELECT tagID FROM connectTable WHERE activityID="+id+")";
        //DataSet howManyTagsAns = mySQLClass.SQLSelect(howManyTagsQury);
        // int tagsNum = Convert.ToInt32(howManyTagsAns.Tables[0].Rows[0][0]);
        // string tagsNameQuery = "SELECT TagTitle FROM tags WHERE ID IN(SELECT tagID FROM connectTable WHERE activityID="+id+")";
        // DataSet tagsNameAns = mySQLClass.SQLSelect(tagsNameQuery);

        // for (int i = 0; i < tagsNum; i++)
        // {
        //     Label tag = new Label();
        //     tag.Text = tagsNameAns.Tables[0].Rows[i][0].ToString();
        //     showTags.Controls.Add(tag);
        //     showTags.Controls.Add(new LiteralControl("<br />"));
        // }
        //תגיות
        string howManyTagsQury = "SELECT COUNT(TagTitle) FROM tags WHERE ID IN(SELECT tagID FROM connectTable WHERE activityID=" + id + ")";
        DataSet howManyTagsAns = mySQLClass.SQLSelect(howManyTagsQury);
        int tagsNum = Convert.ToInt32(howManyTagsAns.Tables[0].Rows[0][0]);
        string tagsNameQuery = "SELECT TagTitle,ID FROM tags WHERE ID IN(SELECT tagID FROM connectTable WHERE activityID=" + id + ")";
        DataSet tagsNameAns = mySQLClass.SQLSelect(tagsNameQuery);

        for (int i = 0; i < tagsNum; i++)
        {

            Label tag = new Label();
            tag.Text = tagsNameAns.Tables[0].Rows[i][0].ToString();
            int tagID = Convert.ToInt32(tagsNameAns.Tables[0].Rows[i][1]);
            if (tagID <= 11)
            {
                population.Controls.Add(tag);
                population.Controls.Add(new LiteralControl("<br />"));
            }
            if (tagID >= 17 && tagID <= 20)
            {
                age.Controls.Add(tag);
                age.Controls.Add(new LiteralControl("<br />"));
            }
            if (tagID >= 21)
            {
                more.Controls.Add(tag);
                more.Controls.Add(new LiteralControl("<br />"));
            }

        }
        //שינויי צבע של הכותרות בהתאם לסוג הפעולה
        string actKind = "SELECT activityType FROM Activities WHERE ID=" + id;
        DataSet actKinsAns = mySQLClass.SQLSelect(actKind);
        string activityKind = actKinsAns.Tables[0].Rows[0][0].ToString();
        switch (activityKind)
        {
            case "morning":
                actBodyServe.CssClass = "headYellow";
                extra.CssClass = "headYellow";
                Label1.CssClass = "headYellow";
                tags.CssClass = "headYellow";
                goals.CssClass = "headYellow";
                break;
            case "dayClose":
                actBodyServe.CssClass = "headYellow";
                extra.CssClass = "headYellow";
                Label1.CssClass = "headYellow";
                tags.CssClass = "headYellow";
                goals.CssClass = "headYellow";
                break;
            case "group":
                actBodyServe.CssClass = "headGreen";
                extra.CssClass = "headGreen";
                Label1.CssClass = "headGreen";
                tags.CssClass = "headGreen";
                goals.CssClass = "headGreen";
                break;
            case "endCamp":
                actBodyServe.CssClass = "headBlue";
                extra.CssClass = "headBlue";
                Label1.CssClass = "headBlue";
                tags.CssClass = "headBlue";
                goals.CssClass = "headBlue";
                break;
            case "otef":
                actBodyServe.CssClass = "headPurple";
                extra.CssClass = "headPurple";
                Label1.CssClass = "headPurple";
                tags.CssClass = "headPurple";
                goals.CssClass = "headPurple";
                break;
            case "community":
                actBodyServe.CssClass = "headPurple";
                extra.CssClass = "headPurple";
                Label1.CssClass = "headPurple";
                tags.CssClass = "headPurple";
                goals.CssClass = "headPurple";
                break;
            case "intro":
                actBodyServe.CssClass = "headRed";
                extra.CssClass = "headRed";
                Label1.CssClass = "headRed";
                tags.CssClass = "headRed";
                tags.CssClass = "headRed";
                goals.CssClass = "headRed";
                break;

        }


    }


    //פונקציה ליצירת תגובה חדשה
    protected void Button3_Click(object sender, EventArgs e)
    {

        string today = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
        //int index = today.LastIndexOf(':');
        //if (index > -1)
        //{
        //    today = today.Remove(index, 3);
        //}

            //string date= today.ToString().Remove(5, 3);
            string newCommentQuery = "INSERT INTO comments (activityID,comment,commentDate) VALUES (" + id+",'" + commentText.Text + "','"+ today + "')";
        mySQLClass.SQLChange(newCommentQuery);
        Page.Response.Redirect(Page.Request.Url.ToString(), true);

    }
    //כפתור מחיקת פעולה
    protected void deleteAct_Click(object sender, EventArgs e)
    {
        string deleteAct = "DELETE FROM Activities WHERE ID=" + id;
        mySQLClass.SQLChange(deleteAct);
        Response.Redirect("Main.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //userEnter.Visible = true;
        //grayWindows.Visible = true;

    }
    protected void openCheck_Click(object sender, EventArgs e)
    {
        //deleteCheck.Visible = true;
        //grayWindows2.Visible = true;

    }
    //protected void extraClick_Click(object sender, EventArgs e)
    //{
    //    //קישור לנספחים
    //    string linkQuery = "SELECT googleDriveLink FROM Activities WHERE ID=" + id;
    //    DataSet linkAns = mySQLClass.SQLSelect(linkQuery);
    //    string link = linkAns.Tables[0].Rows[0][0].ToString();
    //    Response.Redirect (link,false);
    //}


    protected void userEnt_Click(object sender, EventArgs e)
    {
      
        if (passWord.Text == "Aa123456")
        {
            if (userName.Text == "teamleader")
            {
                Session["userName"] = "teamleader";
                newcomment.Visible = true;
                //userEnter.Visible = false;
                //grayWindows.Visible = false;
                login.Visible = false;
                user.Visible = true;
            }
            if (userName.Text == "campleader")
            {
                Session["userName"] = "campleader";
                newcomment.Visible = true;
                //userEnter.Visible = false;
                //grayWindows.Visible = false;
                login.Visible = false;
                user.Visible = true;
            }
        }

        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Confirm();", true);
            wrong.InnerText = "אחד מהפרמטרים שגויים";
            
        }
        if (Session["userName"] != null)//הצגת המשתמש
        {
            if (Session["userName"].ToString() == "campleader")
            {
                currentUser.Text = "היי! מנהלת הנופש";
                openCheck.Visible = true;
            }
            else if (Session["userName"].ToString() == "teamleader")
            {
                currentUser.Text = "היי! ראש הקבוצה";
            }

        }
    }
    protected void logOut_Click(object sender, EventArgs e)
    {
        Session["userName"] = null;
        Page.Response.Redirect(Page.Request.Url.ToString(), true);

    }

}