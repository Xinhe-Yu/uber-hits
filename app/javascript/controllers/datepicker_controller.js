import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startTimeInput"]
  connect() {
    flatpickr(this.startTimeInputTarget, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      minDate: "today",
      maxDate: new Date().fp_incr(14),
      time_24hr: true,
      defaultDate: "16:45",
      minTime: "16:00",
      maxTime: "22:30"
    })
  }
}
