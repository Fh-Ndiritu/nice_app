import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="content-loader"
export default class extends Controller {
  static values = { url: String, refreshInterval: Number}

  connect() {
    this.load({})
    if(this.hasRefreshIntervalValue){
      this.startRefreshing()
    }
  }

  disconnect(){
    this.stopRefreshing()
  }

  load({params}){
    let url = ""
    if(params === undefined){
      url = this.urlValue
    }else{
      url = params.url
    }

    fetch(url)
    .then(response => response.text())
    .then((html) => {
      this.element.querySelector(".text-wrapper").innerHTML = html
    })
    
  }

  startRefreshing(){
    this.refreshTimer = setInterval(()=>{
      this.load({})
     }, this.refreshIntervalValue)
  }

  stopRefreshing(){
    if(this.refreshTimer){
      clearInterval(this.refreshTimer)
    }
  }




}
