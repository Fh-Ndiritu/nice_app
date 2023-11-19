import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slideshow"
export default class extends Controller {
  static targets = ["slide"]
  static values = {index: Number}

 indexValueChanged(){
  this.showCurrentSlide()
 }

 next(){
  if(this.indexValue+1 >= this.slideTargets.length)
    this.indexValue = 0
  else
    this.indexValue++ 
 }

 previous(){
  if(this.indexValue-1 < 0)
    this.indexValue = this.slideTargets.length-1
  else
  this.indexValue--
 }


 showCurrentSlide(){
  this.slideTargets.forEach((element, index) =>{
    element.hidden = index !== this.indexValue
  })
 }
}
