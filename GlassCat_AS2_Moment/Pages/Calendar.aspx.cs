using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlassCat_AS2_Moment.Pages
{
    public partial class Calendar : System.Web.UI.Page
    {
        private ArrayList eventList;
        private ArrayList futureEvents;
        public partial class CustomerEvent
        {
            public DateTime eventDatetime;
            public string eventDescription;

            public CustomerEvent()
            {
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            eventList = new ArrayList();
            futureEvents = new ArrayList();
            DataView events = (DataView)eventSearchDataSource.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView row in events)
            {
                CustomerEvent customerEvent = new CustomerEvent();
                customerEvent.eventDatetime = (DateTime)row["event_datetime"];
                customerEvent.eventDescription = (string)row["description"];
                eventList.Add(customerEvent);

                if (DateTime.Now.Date == customerEvent.eventDatetime) {
                    // today has event
                    selectedEventDescription.Text = customerEvent.eventDescription;
                } 

                if(DateTime.Now.Date < customerEvent.eventDatetime)
                {
                    // future event
                    futureEvents.Add(customerEvent);
                }
            }

            futureEventList.DataSource = futureEvents;
            futureEventList.DataBind();
        }

        protected void EventCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime currentRenderingDate = e.Day.Date;
            foreach(CustomerEvent customerEvent in eventList)
            {
                if (customerEvent.eventDatetime == currentRenderingDate)
                {
                    e.Cell.Font.Bold = true;
                    e.Cell.ForeColor = System.Drawing.Color.Gainsboro;
                    e.Cell.BackColor = System.Drawing.Color.DarkSlateBlue;
                }
            }
        }

        protected void EventCalendar_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = EventCalendar.SelectedDate;
            if (selectedDate == DateTime.Now.Date)
            {
                selectedEventDate.Text = "Today";
            } else
            {
                selectedEventDate.Text = selectedDate.ToShortDateString();
            }

            selectedEventDescription.Text = "No event.";
            foreach (CustomerEvent customerEvent in eventList)
            {
                if (customerEvent.eventDatetime == selectedDate)
                {
                    selectedEventDescription.Text = customerEvent.eventDescription;
                }
            }
        }
    }
}