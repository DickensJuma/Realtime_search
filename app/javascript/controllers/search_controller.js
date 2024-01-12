import { Controller } from "stimulus";
import debounce from "lodash/debounce";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    this.debouncedSubmit = debounce(this.submit, 300);
  }

  submit() {
    const query = this.inputTarget.value;
    if (query.trim() !== "") {
      fetch("/searches", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
        },
        body: JSON.stringify({ query }),
      });
    }
  }

  onChange() {
    this.debouncedSubmit();
  }
}
