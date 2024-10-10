using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Script.Serialization;
using System.Net.Http;


namespace Train_Detail
{
    public partial class Train_Detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected async void BtnSearch_Click(object sender, EventArgs e)
        {
            if (ValidateSearchFields()) // Assuming validation logic is in this method
            {
                string apiUrl = $"https://localhost:44395/TrainDetail/GetTrainDetails?fromDate={TxtFromDate.Text}&toDate={TxtToDate.Text}&fromStation={DropDownListFromStation.SelectedItem.Text}&toStation={DropDownListToStation.SelectedItem.Text}";

                using (HttpClient client = new HttpClient())
                {
                    HttpResponseMessage response = await client.GetAsync(apiUrl);

                    if (response.IsSuccessStatusCode)
                    {
                        string jsonData = await response.Content.ReadAsStringAsync();
                        var trainDetails = new JavaScriptSerializer().Deserialize<List<TrainDetail>>(jsonData);

                        if (trainDetails.Count > 0)
                        {
                            GridViewTrainDetails.DataSource = trainDetails;
                            GridViewTrainDetails.DataBind();
                            lblPageMessage.Text = "<h3>Your Result Is Ready!</h3>";
                        }
                        else
                        {
                            GridViewTrainDetails.DataSource = null;
                            GridViewTrainDetails.DataBind();
                            lblPageMessage.Text = "<h3>No Records Found.</h3>";
                        }
                    }
                    else
                    {
                        lblPageMessage.Text = "Error occurred while fetching data.";
                    }
                }
            }
        }
        private bool ValidateSearchFields()
        {
            bool isValid = true;

            // Check if From Date and To Date are entered
            if (string.IsNullOrEmpty(TxtFromDate.Text) || string.IsNullOrEmpty(TxtToDate.Text))
            {
                Response.Write("<script>alert('Please Select Both From Date And To Date')</script>");
                MessageFromDate.Text = "*";
                MessageToDate.Text = "*";
                MessageToDate.ForeColor = System.Drawing.Color.Red;
                MessageFromDate.ForeColor = System.Drawing.Color.Red;
                isValid = false;
            }
            else 
            {
                DateTime fromDate, toDate;
                if (!DateTime.TryParse(TxtFromDate.Text, out fromDate) || !DateTime.TryParse(TxtToDate.Text, out toDate))
                {
                    Response.Write("<script>alert('Invalid date format. Please enter valid dates.')</script>");
                    isValid = false;
                }
                else if (fromDate > toDate)
                {
                    Response.Write("<script>alert('From Date cannot be greater than To Date')</script>");
                    isValid = false;
                }
            }

            // Check if both From Station and To Station are selected
            if (DropDownListFromStation.SelectedIndex == 0 || DropDownListToStation.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Please Select Valid Stations')</script>");
                if (DropDownListFromStation.SelectedIndex == 0)
                {
                    MessageFromStation.Text = "*";
                    MessageFromStation.ForeColor = System.Drawing.Color.Red;
                }
                if (DropDownListToStation.SelectedIndex == 0)
                {
                    MessageToStation.Text = "*";
                    MessageToStation.ForeColor = System.Drawing.Color.Red;
                }
                isValid = false;
            }

            return isValid;
        }


    }
}

public class TrainDetail
{
    public string TrainName { get; set; }
    public string PNRNumber { get; set; }
    public string Timing { get; set; }
    public int PlatformNumber { get; set; }
    public decimal TotalFare { get; set; }
    public DateTime DateOfJourney { get; set; }
}
