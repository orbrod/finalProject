using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Default2 : System.Web.UI.Page
{
    SQLClass mySQLClass = new SQLClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        //בריצה הראשונה של העמוד
        if (Page.IsPostBack == false)
        {
            //הסתרה של החלון האפור
            //grayWindows.Visible = false;

            //הסתרת של חלונות הפופ-אפ
            //userEnter.Visible = false;
            addNewAct.Visible = false;
            user.Visible = false;
            //הסתרה של בחירתתגיות
           

        }

        if (Session["userName"] != null)//הצגת המשתמש
        {
            user.Visible = true;
            addNewAct.Visible = true;
            login.Visible = false;
            
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




    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["id"] = saveInfo.Value;
        Response.Redirect("showActivity.aspx");
    }

    protected void continuNewAct_Click(object sender, EventArgs e)
    {
        string actType = activityType.SelectedValue;
        //יצירת שורה של פעולה חדשה בטבלת activities
        string newAct = "INSERT INTO Activities (activityName,activityType) VALUES ('" + actName.Text + "','"+actType+"')";
        mySQLClass.SQLChange(newAct);
        string actIdQuery = "SELECT TOP 1 ID FROM Activities ORDER BY ID DESC";                                                  //האיידי של הפעולה
        DataSet actIdAns = mySQLClass.SQLSelect(actIdQuery);
        int actId = Convert.ToInt32(actIdAns.Tables[0].Rows[0][0].ToString());

        //הוספת תגיות
        
        foreach (ListItem item in tagsList1.Items)
        {
            if (item.Selected == true)
            {
                string insertTag = "INSERT INTO connectTable (activityID,tagID) VALUES (" + actId + ",'" + item.Value + "')";
                mySQLClass.SQLChange(insertTag);
            }
        }
        foreach (ListItem item in tagsList2.Items)
        {
            if (item.Selected == true)
            {
                string insertTag = "INSERT INTO connectTable (activityID,tagID) VALUES (" + actId + ",'" + item.Value + "')";
                mySQLClass.SQLChange(insertTag);
            }
        }

        foreach (ListItem item in tagsList3.Items)
        {
            if (item.Selected == true)
            {
                string insertTag = "INSERT INTO connectTable (activityID,tagID) VALUES (" + actId + ",'" + item.Value + "')";
                mySQLClass.SQLChange(insertTag);
            }
        }


        Response.Redirect("newActivity.aspx");
    }



    protected void logOut_Click(object sender, EventArgs e)
    {
        Session["userName"] = null;
        Page.Response.Redirect(Page.Request.Url.ToString(), true);

    }

    

    protected void userEnt_Click(object sender, EventArgs e)
    {

        if (passWord.Text == "Aa123456")
        {
            if (userName.Text == "teamleader")
            {
                Session["userName"] = "teamleader";
                addNewAct.Visible = true;
                //userEnter.Visible = false;
                //grayWindows.Visible = false;
                login.Visible = false;
                user.Visible = true;
            }
            if (userName.Text == "campleader")
            {
                Session["userName"] = "campleader";
                addNewAct.Visible = true;
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
            }
            else if (Session["userName"].ToString() == "teamleader")
            {
                currentUser.Text = "היי! ראש הקבוצה";
            }

        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        //userEnter.Visible = false;
        //grayWindows.Visible = false;
    }
}