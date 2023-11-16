import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize(){
    this.nameElement.value = this.name
    console.log(this.targets.find("name").value)
  }

  log_me(){
    var val = this.nameElement.value
    console.log(val)
  }

  paste(event){
    event.preventDefault()
    alert("pasting not allowed")
  }

  get name(){
    if(this.data.has("name")){
      return this.data.get("name")
    }else{
      return "Just A user"
    }
  }

  get nameElement(){
    return this.targets.find("name")
  }
}
