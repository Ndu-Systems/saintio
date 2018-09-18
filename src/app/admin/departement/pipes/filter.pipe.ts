import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filterDates'
})
export class FilterPipe implements PipeTransform {

  transform(array: Array<any>, date:string): any {
    // if(!date) return array;
    // return array.filter(i=>i.date===date)  //|| i.date === "new"
    let selectedDateLS =  array.filter(i=>i.date===date);
    let newLS =  array.filter(i=>i.date === "new");
    newLS.forEach(nl=>{
      let newLSId = nl.id;
      let canPush = true;
      selectedDateLS.forEach(sl=>{
      if(nl.id === sl.id){
        canPush = false;
      }
      })
      if(canPush){
        selectedDateLS.push(nl);
      }
    })
    return selectedDateLS;
  }
}
