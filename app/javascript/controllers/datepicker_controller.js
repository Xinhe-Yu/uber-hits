import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startTimeInput", "endTimeInput"]
  connect() {
    flatpickr(this.startTimeInputTarget, {
      "plugins": [new rangePlugin({ input: this.endTimeInputTarget})],
      enableTime: true,

      })
  }
}
