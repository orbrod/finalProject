using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


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
            //הסתרה של בחירתתגיות


        }
        //משתשמ מחובר
        if (Session["userName"] != null)//הצגת המשתמש
        {
            if (Session["userName"].ToString() == "campleader")
            {
                currentUser.Text = "מנהלת נופש";
            }
            else if (Session["userName"].ToString() == "teamleader")
            {
                currentUser.Text = "ראש קבוצה";
            }

        }
        string actIdQuery = "SELECT TOP 1 activityName,activityType FROM Activities ORDER BY ID DESC";                                                  //האיידי של הפעולה
        DataSet actIdAns = mySQLClass.SQLSelect(actIdQuery);
       string activityName =actIdAns.Tables[0].Rows[0][0].ToString();
        string activityType= actIdAns.Tables[0].Rows[0][1].ToString();
        
        // סוג הפעולה בעברית
        switch (activityType)
        {
            case "morning":
                activityType = "פעילות בוקר";
                actBodyServe.CssClass = "yellow1";
                extra.CssClass = "yellow1";
                tags.CssClass = "yellow1";
                goals.CssClass = "yellow1";
                break;
            case "group":
                activityType = "פעילות קבוצה";
                
                actBodyServe.CssClass = "green1";
                extra.CssClass = "green1";
                tags.CssClass = "green1";
                goals.CssClass = "green1";
                break;
            case "intro":
                activityType = "פעילות היכרות ותקנון";
                actBodyServe.CssClass = "red1";
                extra.CssClass = "red1";
                tags.CssClass = "red1";
                goals.CssClass = "red1";
                break;
            case "endCamp":
                activityType = "פעילות סיכום ופרידה";
                actBodyServe.CssClass = "blue1";
                extra.CssClass = "blue1";
                tags.CssClass = "blue1";
                goals.CssClass = "blue1";
                break;
            case "otef":
                activityType = "פעילות מתחמים";
                actBodyServe.CssClass = "purple1";
                extra.CssClass = "purple1";
                tags.CssClass = "purple1";
                goals.CssClass = "purple1";
                break;
            case "community":
                activityType = "פעילות קהילתית";
                actBodyServe.CssClass = "purple1";
                extra.CssClass = "purple1";
                tags.CssClass = "purple1";
                goals.CssClass = "purple1";
                break;
            case "dayClose":
                activityType = "פעילות סיכום יום";
                actBodyServe.CssClass = "yellow1";
                extra.CssClass = "yellow1";
                tags.CssClass = "yellow1";
                goals.CssClass = "yellow1";
                break;

        }
        actName.Text = activityName+", "+activityType;
        

        string IdQuery = "SELECT TOP 1 ID FROM Activities ORDER BY ID DESC";                                                  //האיידי של הפעולה
        DataSet IdAns = mySQLClass.SQLSelect(IdQuery);
         id = Convert.ToInt32(IdAns.Tables[0].Rows[0][0].ToString());

        //להוסיף פקודה של הוספה ומחיקה לגרידווי לפי האיידי של הפעולה 
        SqlDataSource2.SelectCommand = "SELECT * FROM activityMain WHERE activityID=" + id;
        SqlDataSource2.DeleteCommand = "DELETE * FROM activityMain WHERE activityID=" + id;

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


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // של הוספה שאילתת SQL רגילה
        string insertQuery = "INSERT INTO activityMain (activityID,method,explanation,aids,metodTime) VALUES (" + id + ",'"+method.Text+"','"+explain.Text+"','"+aids.Text+"',"+time.Text+") ";
        mySQLClass.SQLChange(insertQuery);
        SqlDataSource2.DataBind();
        GridView2.DataBind();
        //ניקויי תיבות טקסט
        method.Text = "";
        explain.Text = "";
        aids.Text = "";
        time.Text = "";
    }

    protected void saveBTn_Click(object sender, EventArgs e)
    {
        //int activityTime = Convert.ToInt32(activityDuration.SelectedValue);
        //string goal_1 = goal1.Text;
        //string goal_2 = goal2.Text;

        //string updateQuery = "UPDATE Activities SET activityGoal1='"+goal_1+"' , activityGoal2='"+goal_2+"' , activityDuration="+activityTime+" WHERE ID="+id;
        //mySQLClass.SQLChange(updateQuery);
        //Response.Redirect("Main.aspx");
    }

    protected void continuBTN_Click(object sender, EventArgs e)
    {
        //שאילתה המחזיקה את כל התגיות שמקושרות לאותה פעוךה
        string existTagQuery = "SELECT tagID FROM connectTable WHERE activityID=" + id;
        DataSet exitTags = mySQLClass.SQLSelect(existTagQuery);
        string existTagNumQuery = "SELECT COUNT(tagID) FROM connectTable WHERE activityID=" + id;
        DataSet existsTagNumAns = mySQLClass.SQLSelect(existTagNumQuery);
        bool exist = false;
        foreach (ListItem item in tagsList1N.Items)
        {
            if (item.Selected == true)
            {
                //בדיקה האם כבר קיימת תגית כזו
                for(int i = 0; i < Convert.ToInt32(existsTagNumAns.Tables[0].Rows[0][0]); i++)
                {
                    if (item.Value == exitTags.Tables[0].Rows[i][0].ToString())
                    {
                        exist = true;

                    }
                }
                if (exist == false)
                {
                    string insertTag = "INSERT INTO connectTable (activityID,tagID) VALUES (" + id + ",'" + item.Value + "')";
                    mySQLClass.SQLChange(insertTag);
                }
            }
            exist = false;
        }
        foreach (ListItem item in tagsList2N.Items)
        {
            if (item.Selected == true)
            {
                //בדיקה האם כבר קיימת תגית כזו
                for (int i = 0; i < Convert.ToInt32(existsTagNumAns.Tables[0].Rows[0][0]); i++)
                {
                    if (item.Value == exitTags.Tables[0].Rows[i][0].ToString())
                    {
                        exist = true;
                    }
                }
                if (exist == false)
                {
                    string insertTag = "INSERT INTO connectTable (activityID,tagID) VALUES (" + id + ",'" + item.Value + "')";
                    mySQLClass.SQLChange(insertTag);
                }
            }
            exist = false;
        }

        foreach (ListItem item in tagsList3N.Items)
        {
            if (item.Selected == true)
            {
                //בדיקה האם כבר קיימת תגית כזו
                for (int i = 0; i < Convert.ToInt32(existsTagNumAns.Tables[0].Rows[0][0]); i++)
                {
                    if (item.Value == exitTags.Tables[0].Rows[i][0].ToString())
                    {
                        exist = true;
                    }
                }
                if (exist == false)
                {
                    string insertTag = "INSERT INTO connectTable (activityID,tagID) VALUES (" + id + ",'" + item.Value + "')";
                    mySQLClass.SQLChange(insertTag);
                }
            }
            exist = false;
        }
        if (activityType.SelectedValue != "")
        {
            string updateType= "UPDATE Activities SET activityType = '"+activityType.SelectedValue+"' WHERE ID ="+id;
            mySQLClass.SQLChange(updateType);
        }

        //עדכון סוג הפעולה
        string actIdQuery = "SELECT TOP 1 activityName,activityType FROM Activities ORDER BY ID DESC";                                                  //האיידי של הפעולה
        DataSet actIdAns = mySQLClass.SQLSelect(actIdQuery);
        string activityName = actIdAns.Tables[0].Rows[0][0].ToString();
        string activityType1 = actIdAns.Tables[0].Rows[0][1].ToString();
        switch (activityType1)
        {
            case "morning":
                activityType1 = "פעילות בוקר";
                actBodyServe.CssClass = "yellow1";
                extra.CssClass = "yellow1";
                tags.CssClass = "yellow1";
                goals.CssClass = "yellow1";
                break;
            case "group":
                activityType1 = "פעילות קבוצה";

                actBodyServe.CssClass = "green1";
                extra.CssClass = "green1";
                tags.CssClass = "green1";
                goals.CssClass = "green1";
                break;
            case "intro":
                activityType1 = "פעילות היכרות ותקנון";
                actBodyServe.CssClass = "red1";
                extra.CssClass = "red1";
                tags.CssClass = "red1";
                goals.CssClass = "red1";
                break;
            case "endCamp":
                activityType1 = "פעילות סיכום ופרידה";
                actBodyServe.CssClass = "blue1";
                extra.CssClass = "blue1";
                tags.CssClass = "blue1";
                goals.CssClass = "blue1";
                break;
            case "otef":
                activityType1 = "פעילות מתחמים";
                actBodyServe.CssClass = "purple1";
                extra.CssClass = "purple1";
                tags.CssClass = "purple1";
                goals.CssClass = "purple1";
                break;
            case "community":
                activityType1 = "פעילות קהילתית";
                actBodyServe.CssClass = "purple1";
                extra.CssClass = "purple1";
                tags.CssClass = "purple1";
                goals.CssClass = "purple1";
                break;
            case "dayClose":
                activityType1 = "פעילות סיכום יום";
                actBodyServe.CssClass = "yellow1";
                extra.CssClass = "yellow1";
                tags.CssClass = "yellow1";
                goals.CssClass = "yellow1";
                break;

        }

        actName.Text = activityName + ", " + activityType1;
        //ניקויי פאנלים 
        population.Controls.Clear();
        age.Controls.Clear();
        more.Controls.Clear();
        population.Controls.Add(populationLable);
        population.Controls.Add(new LiteralControl("<br />"));
        age.Controls.Add(ageLable);
        age.Controls.Add(new LiteralControl("<br />"));
        more.Controls.Add(moreLable);
        more.Controls.Add(new LiteralControl("<br />"));
        //הצגת תגיות
        string howManyTagsQury = "SELECT COUNT(TagTitle) FROM tags WHERE ID IN(SELECT tagID FROM connectTable WHERE activityID=" + id + ")";
        DataSet howManyTagsAns = mySQLClass.SQLSelect(howManyTagsQury);
        int tagsNum = Convert.ToInt32(howManyTagsAns.Tables[0].Rows[0][0]);
        string tagsNameQuery = "SELECT TagTitle,ID FROM tags WHERE ID IN(SELECT tagID FROM connectTable WHERE activityID=" + id + ")";
       
        DataSet tagsNameAns = mySQLClass.SQLSelect(tagsNameQuery);

        for (int i = 0; i < tagsNum; i++)
        {

            Label tag = new Label();
            tag.Text = tagsNameAns.Tables[0].Rows[i][0].ToString();
            int tagID= Convert.ToInt32(tagsNameAns.Tables[0].Rows[i][1]);
            if (tagID <= 11)
            {
                population.Controls.Add(tag);
                population.Controls.Add(new LiteralControl("<br />"));
            }
            if(tagID>=17 && tagID <= 20)
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
    }



    protected void saveAndretuen_Click(object sender, EventArgs e)
    {
        int activityTime = Convert.ToInt32(activityDuration.SelectedValue);
        string goal_1 = goal1.Text;
        string goal_2 = goal2.Text;
        string googleDriveLinkU = googleDriveLink.Text;
        string updateQuery = "UPDATE Activities SET activityGoal1='" + goal_1 + "' , activityGoal2='" + goal_2 + "' , activityDuration=" + activityTime + ",googleDriveLink='"+googleDriveLinkU+"' WHERE ID=" + id;
        mySQLClass.SQLChange(updateQuery);
        Response.Redirect("Main.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //userEnter.Visible = true;
        //grayWindows.Visible = true;

    }
    protected void userEnt_Click(object sender, EventArgs e)
    {

        if (passWord.Text == "Aa123456")
        {
            if (userName.Text == "teamleader")
            {
                Session["userName"] = "teamleader";
                
                //userEnter.Visible = false;
                //grayWindows.Visible = false;
                Button2.InnerHtml = "החלפת משתמש";
                user.Visible = true;
            }
            if (userName.Text == "campleader")
            {
                Session["userName"] = "campleader";
                
                //userEnter.Visible = false;
                //grayWindows.Visible = false;
                Button2.InnerHtml = "החלפת משתמש";
                user.Visible = true;
            }
        }

        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Confirm();", true);
            wrong.Text = "אחד מהפרמטרים שגויים";

        }
        if (Session["userName"] != null)//הצגת המשתמש
        {
            if (Session["userName"].ToString() == "campleader")
            {
                currentUser.Text = "היי! מנהלת הנופש";
            }
            else if (Session["userName"].ToString() == "teamleader")
            {
                currentUser.Text = "היי! ראש הקבוצה";
            }

        }
    }
    //protected void Tags_Click(object sender, EventArgs e)
    //{
    //    //הצגת רק תגיות שלא קיימות בפעולה עצמה

    //    //שאילתה המחזיקה את כל התגיות שמקושרות לאותה פעוךה
    //    string existTagQuery = "SELECT tagID FROM connectTable WHERE activityID=" + id;
    //    DataSet exitTags = mySQLClass.SQLSelect(existTagQuery);
    //    string existTagNumQuery = "SELECT COUNT(tagID) FROM connectTable WHERE activityID=" + id;
    //    DataSet existsTagNumAns = mySQLClass.SQLSelect(existTagNumQuery);

    //    foreach (ListItem item in tagsList1N.Items)
    //    {

    //        //בדיקה האם כבר קיימת תגית כזו
    //        for (int i = 0; i < Convert.ToInt32(existsTagNumAns.Tables[0].Rows[0][0]); i++)
    //        {
    //            if (item.Value == exitTags.Tables[0].Rows[i][0].ToString())
    //            {

    //                tagsList1N.Items.Remove(item);
    //            }
    //        }



    //    }
    //    foreach (ListItem item in tagsList2N.Items)
    //    {

    //        //בדיקה האם כבר קיימת תגית כזו
    //        for (int i = 0; i < Convert.ToInt32(existsTagNumAns.Tables[0].Rows[0][0]); i++)
    //        {
    //            if (item.Value == exitTags.Tables[0].Rows[i][0].ToString())
    //            {
    //                tagsList2N.Items.Remove(item);
    //            }
    //        }



    //    }

    //    foreach (ListItem item in tagsList3N.Items)
    //    {

    //        //בדיקה האם כבר קיימת תגית כזו
    //        for (int i = 0; i < Convert.ToInt32(existsTagNumAns.Tables[0].Rows[0][0]); i++)
    //        {
    //            if (item.Value == exitTags.Tables[0].Rows[i][0].ToString())
    //            {
    //                tagsList3N.Items.Remove(item);
    //            }
    //        }



    //    }
    //}

}
       
