import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filterByDate'
})
export class FilterByDatePipe implements PipeTransform {

  transform(array: Array<any>, date:string, status?): any {
    if(!date && !status) return array;
    if(!date) return array.filter(x=>x.status===status);
    if(!status) return array.filter(x=>x.date===date);
    return array.filter(x=>x.date===date && x.status ===status);
  }

}
