import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="copy-clipboard"
export default class extends Controller {

  static targets = ['source']
  copy(){
    navigator.clipboard.writeText(this.sourceTarget.value)
  }
}
