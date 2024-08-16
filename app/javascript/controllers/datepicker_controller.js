import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startTimeInput"]
  connect() {
    const localDate = new Date();
    const nextHour = localDate.getHours() + 1;
    const todayMinTime = Math.max(nextHour, 9);

    flatpickr(this.startTimeInputTarget, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      minDate: "today",
      maxDate: new Date().fp_incr(14),
      time_24hr: true,
      defaultDate: new Date(localDate.setHours(todayMinTime, 0, 0, 0)),
      minTime: "${todayMinTime}:00",
      maxTime: "22:30",
      onChange: function (selectedDates, _, instance) {
        const selectedDate = selectedDates[0];
        if (selectedDate) {
          const selectedDay = selectedDate.getDate();
          const today = localDate.getDate();
          if (selectedDay !== today) {
            instance.set({ minTime: "09:00" });
          } else {
            instance.set({ minTime: todayMinTime });
          }
        }
      }
    });
  }
}
